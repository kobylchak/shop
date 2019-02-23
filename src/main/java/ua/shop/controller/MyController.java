package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.*;
import ua.shop.service.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MyController {
    private static final int ITEMS_PER_PAGE = 6;
    @Autowired
    private UserService userService;
    @Autowired
    private MobileService mobileService;
    @Autowired
    private PhotoService photoService;
    @Autowired
    private BasketService basketService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/")
    public String index(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        if (login.equals("admin")) model.addAttribute("admin", "admin");
        else model.addAttribute("user", "user");
        CustomUser dbUser = userService.getUserByLogin(login);
        List<Brand> brands = mobileService.findBrands();
        String basketName = login+"Basket"+ dbUser.getBasketNumber();
        Basket basket = basketService.findBasketByName(basketName);
        model.addAttribute("basket", basket);
        model.addAttribute("basketName", basketName);
        model.addAttribute("brands", brands);
        model.addAttribute("login", login);
        model.addAttribute("roles", user.getAuthorities());
//        model.addAttribute("email", dbUser.getEmail());
//        model.addAttribute("phone", dbUser.getPhone());
        return "index";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String email, @RequestParam(required = false) String phone) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser dbUser = userService.getUserByLogin(login);
        dbUser.setEmail(email);
        dbUser.setPhone(phone);
        userService.updateUser(dbUser);
        return "redirect:/";
    }

    @RequestMapping(value = "/newuser", method = RequestMethod.POST)
    public String update(@RequestParam String login,
                         @RequestParam String password,
                         @RequestParam(required = false) String email,
                         @RequestParam(required = false) String phone,
                         Model model) {
        if (userService.existsByLogin(login)) {
            model.addAttribute("exists", true);
            return "register";
        }
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String passHash = passwordEncoder.encode(password);
        List<Basket> baskets = new ArrayList<>();
        CustomUser dbUser = new CustomUser(login, passHash, UserRole.USER, email, phone, baskets);
        userService.addUser(dbUser);
        String basketName = login + "Basket" + dbUser.getBasketNumber();
        Basket basket = new Basket(basketName, dbUser);
        basketService.saveBasket(basket);
        return "redirect:/";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/forgot")
    public String forgot() {
        return "forgot";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("login", user.getUsername());
        return "unauthorized";
    }

    @RequestMapping("/admin")
    public String admin(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<Mobile> mobiles = mobileService
                .findAll(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("brands", mobileService.findBrands());
        model.addAttribute("allPages", getPageCount());
        model.addAttribute("mobiles", mobiles);
        return "admin";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model,
                         @RequestParam String pattern) {

        model.addAttribute("brands", mobileService.findBrands());
        model.addAttribute("mobiles", mobileService.findByPattern(pattern, null));
        return "admin";
    }

    private long getPageCount() {
        long totalCount = mobileService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}