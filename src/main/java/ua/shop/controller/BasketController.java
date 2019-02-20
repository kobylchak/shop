package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.shop.dao.Basket;
import ua.shop.dao.Mobile;
import ua.shop.service.BasketService;
import ua.shop.service.MobileService;
import ua.shop.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/basket")
public class BasketController {
    @Autowired
    private MobileService mobileService;
    @Autowired
    private BasketService basketService;
    @Autowired
    private UserService userService;

    @GetMapping("/show/{basketName}")
    public String showBasket(Model model,
                             @PathVariable String basketName) {
        Basket basket = basketService.findBasketByName(basketName);
        model.addAttribute("basket", basket);
        return "basket";
    }

    @GetMapping("/{mobile.id}")
    public String addMobileToBasket(Model model,
                                    @PathVariable(value = "mobile.id") long mobileId) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        List<Basket> baskets = basketService.findBaskets();
        Basket basket = basketService.findBasketByName(login + "Basket");
        Mobile mobile = mobileService.findMobileById(mobileId);
        mobile.setBaskets(baskets);
        basket.getMobiles().add(mobile);
        basketService.saveBasket(basket);
        model.addAttribute("basket", basket);
        return "redirect:/";
    }
    @GetMapping("/delete/{mobile.id}")
    public String deleteMobileFromBasket(Model model,
                                    @PathVariable(value = "mobile.id") long mobileId) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        Mobile mobile = mobileService.findMobileById(mobileId);
        Basket basket = basketService.findBasketByName(login + "Basket");
        mobile.setBaskets(null);
        basket.getMobiles().remove(mobile);
        basketService.saveBasket(basket);
        model.addAttribute("basket", basket);
        return "redirect:/";
    }
}
