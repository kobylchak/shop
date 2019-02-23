package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.Basket;
import ua.shop.dao.CustomUser;
import ua.shop.dao.Mobile;
import ua.shop.dao.Order;
import ua.shop.service.BasketService;
import ua.shop.service.MobileService;
import ua.shop.service.OrderService;
import ua.shop.service.UserService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
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
    @Autowired
    private OrderService orderService;


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
        CustomUser dbUser = userService.getUserByLogin(login);

        List<Basket> baskets = basketService.findByCystomUser(dbUser);
        String basketName = login + "Basket" + dbUser.getBasketNumber();
        Basket basket = basketService.findBasketByName(basketName);
        Mobile mobile = mobileService.findMobileById(mobileId);
        mobile.setBaskets(baskets);
        basket.getMobiles().add(mobile);
        basket.setTotalPrice(basket.getTotalPrice());
        basketService.saveBasket(basket);
        model.addAttribute("basket", basket);
        return "redirect:/";
    }

    @GetMapping("/delete/{mobile.id}")
    public String deleteMobileFromBasket(Model model,
                                         @PathVariable(value = "mobile.id") long mobileId) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser dbUser = userService.getUserByLogin(login);
        String basketName = login + "Basket" + dbUser.getBasketNumber();
        Basket basket = basketService.findBasketByName(basketName);

        Mobile mobile = mobileService.findMobileById(mobileId);

        basket.getMobiles().remove(mobile);
        mobile.setBaskets(null);
        basket.setTotalPrice(basket.getTotalPrice());
        basketService.saveBasket(basket);
        model.addAttribute("basket", basket);
        return "redirect:/";
    }

    @GetMapping("/buy")
    public String showBuy(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser dbUser = userService.getUserByLogin(login);
        String basketName = login + "Basket" + dbUser.getBasketNumber();
        Basket basket = basketService.findBasketByName(basketName);
        if (basket.getMobiles().isEmpty()) {
//            model.addAttribute("basket", basket);
//            model.addAttribute("basketName", basketName);
            return "redirect:/";
        } else return "basket_buy_page";
    }

    @PostMapping("/buy")
    public String buyBasket(Model model,
                            @RequestParam String delMethod,
                            @RequestParam String delAddress,
                            HttpServletRequest request
//                            @RequestParam Date date
    ) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser dbUser = userService.getUserByLogin(login);

        String date = LocalDate.now().toString();
        String time = LocalTime.now().toString();

        String basketName = login + "Basket" + dbUser.getBasketNumber();

        Basket basket = basketService.findBasketByName(basketName);

        basket.setPaid("paid");

        String ip = request.getRemoteAddr();
        Order order = new Order(dbUser, basket, delMethod, delAddress, ip);
        orderService.saveOrder(order);

//        basket.getMobiles().clear();

//        for (Mobile mobile : basket.getMobiles()) {
//            mobile.setBaskets(null);
//
//        }
//basketService.saveBasket(basket);
//        basketService.saveBasket(basket);
        dbUser.setBasketNumber(dbUser.getBasketNumber()+1);
        userService.updateUser(dbUser);
        Basket bas = new Basket(login + "Basket" + dbUser.getBasketNumber(), dbUser);
        basketService.saveBasket(bas);
        return "redirect:/";
    }

}
