package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.Basket;
import ua.shop.dao.CustomUser;
import ua.shop.dao.UserRole;
import ua.shop.service.BasketService;
import ua.shop.service.MobileService;
import ua.shop.service.UserService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {
    @Autowired
    private BasketService basketService;

    @Autowired
    private MobileService mobileService;

    @Autowired
    private UserService userService;

    @GetMapping
    public String findUsers(Model model){
        List<CustomUser> users = userService.findAllCustomUser();
        model.addAttribute("users", users);
        return "users_page";
    }

    @PostMapping("/delete")
    public ResponseEntity<Void> deleteUser(@RequestParam(value = "toDo[]", required = false) long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
            userService.deleteUser(toDelete);
        return new ResponseEntity<>(HttpStatus.OK);
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
}
