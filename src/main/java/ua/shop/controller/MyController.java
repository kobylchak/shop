package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ua.shop.dao.*;
import ua.shop.service.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MyController {
    private static final int ITEMS_PER_PAGE = 6;
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private BasketService basketService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private MobileService mobileService;

    @RequestMapping("/")
    public String index(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        if (login.equals("admin")) model.addAttribute("admin", "admin");
        else model.addAttribute("user", "user");
        CustomUser dbUser = userService.getUserByLogin(login);
        List<Brand> brands = brandService.findBrands();
        String basketName = login + "Basket" + dbUser.getBasketNumber();
        Basket basket = basketService.findBasketByName(basketName);
        model.addAttribute("basket", basket);
        model.addAttribute("basketName", basketName);
        model.addAttribute("brands", brands);
        model.addAttribute("login", login);
        model.addAttribute("roles", user.getAuthorities());
        model.addAttribute("mobiles", mobileService.findAll());
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
    public String update(@RequestParam String first,
                         @RequestParam String last,
                         @RequestParam String login,
                         @RequestParam String email,
                         @RequestParam String password,
                         RedirectAttributes redir,
                         Model model) {
        if (userService.existsByLogin(login)) {
            redir.addFlashAttribute("exists", true);
            return "redirect:/login";
        }
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String passHash = passwordEncoder.encode(password);
        List<Basket> baskets = new ArrayList<>();
        CustomUser dbUser = new CustomUser(login, passHash, UserRole.USER, first, last, email, baskets);
        userService.addUser(dbUser);
        String basketName = login + "Basket" + dbUser.getBasketNumber();
        Basket basket = new Basket(basketName, dbUser);
        basketService.saveBasket(basket);
        return "redirect:/";
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

    @GetMapping("/admin")
    public String getOrders(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<Order> orders = orderService.findAllOrders(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("allPages", getPageCount());
        model.addAttribute("orders", orders);
        return "admin";
    }

    private long getPageCount() {
        long totalCount = orderService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }

}