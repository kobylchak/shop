package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.shop.dao.Basket;
import ua.shop.dao.Brand;
import ua.shop.dao.CustomUser;
import ua.shop.service.BasketService;
import ua.shop.service.BrandService;
import ua.shop.service.MobileService;
import ua.shop.service.UserService;

import java.util.List;

@Controller
public class MyController {
//    private static final int ITEMS_PER_PAGE = 6;
    @Autowired
    private BrandService brandService;
    @Autowired
    private UserService userService;
    @Autowired
    private MobileService mobileService;
    @Autowired
    private BasketService basketService;

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

//    @RequestMapping("/register")
//    public String register() {
//        return "register";
//    }

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

//    @RequestMapping("/admin")
//    public String admin(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
//        if (page < 0) page = 0;
//        List<Mobile> mobiles = mobileService
//                .findAll(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
//        model.addAttribute("brands", brandService.findBrands());
//        model.addAttribute("allPages", getPageCount());
//        model.addAttribute("mobiles", mobiles);
//        return "admin";
//    }

//    @RequestMapping(value = "/admin/search", method = RequestMethod.POST)
//    public String search(Model model,
//                         @RequestParam String pattern) {
//
//        model.addAttribute("brands", brandService.findBrands());
//        model.addAttribute("mobiles", mobileService.findByPattern(pattern, null));
//        return "mobile";
//    }

//    private long getPageCount() {
//        long totalCount = mobileService.count();
//        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
//    }
}