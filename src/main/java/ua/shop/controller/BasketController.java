package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.*;
import ua.shop.service.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.GregorianCalendar;
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
    @Autowired
    private MobilePhoneService mobilePhoneService;

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
        CustomUser dbUser = getCustomUser();
        Basket basket = basketService.findBasketByUsAndPaid(dbUser, "not paid");
        Mobile mobile = mobileService.findMobileById(mobileId);

        if (checkAbsentMobilePhones(mobile)) return "redirect:/";
//        MobilePhone mobilePhone = mobilePhoneService.getFirstByBasketIsNullAndMobile(mobile);
        MobilePhone mobilePhone = mobilePhoneService.getFirstMobilePhoneByMobileAndStatus(mobile, PhoneStatus.FORSALE);

        mobilePhone.setStatus(PhoneStatus.INBASKET);
        mobilePhoneService.saveMobilePhone(mobilePhone);
        mobilePhone.setBasket(basket);
//        mobilePhoneService.saveMobilePhone(mobilePhone);
        basket.getPhones().add(mobilePhone);

        basket.setTotalPrice(basket.countTotalPrice());
        basket.setTotalQuantity(basket.countTotalQuantity());// -додати кількість товару
        basket.setContent(true);
//        mobile.setDiscount(100);
//        mobileService.saveMobile(mobile);
        basketService.saveBasket(basket);
        model.addAttribute("basket", basket);
        return "redirect:/";
    }

    @GetMapping("/delete/{phone.id}")
    public String deleteMobileFromBasket(Model model,
                                         @PathVariable(value = "phone.id") long mobilePhoneId) {
        CustomUser dbUser = getCustomUser();
        Basket basket = basketService.findBasketByUsAndPaid(dbUser, "not paid");
        MobilePhone phone = mobilePhoneService.findMobilePhoneById(mobilePhoneId);
        phone.setStatus(PhoneStatus.FORSALE);
        mobilePhoneService.saveMobilePhone(phone);
        basket.getPhones().remove(phone);
        basket.setTotalPrice(basket.countTotalPrice());
        phone.setBasket(null);
        basket.setTotalQuantity(basket.countTotalQuantity());
        if (basket.getTotalQuantity() == 0){
            basket.setContent(false);
        }
        basketService.saveBasket(basket);
        model.addAttribute("basket", basket);
        return "basket";
    }

    @GetMapping("/buy")
    public String showBuy(Model model) {
        CustomUser dbUser = getCustomUser();
        Basket basket = basketService.findBasketByName(dbUser.getLogin() + "Basket" + dbUser.getBasketNumber());
        if (basket.getPhones().isEmpty()) {
            return "redirect:/";
        } else return "basket_buy_page";
    }

    @PostMapping("/buy")
    public String buyBasket(@RequestParam String delMethod,
                            @RequestParam String delAddress,
                            HttpServletRequest request
    ) {
        CustomUser dbUser = getCustomUser();
        Basket basket = basketService.findBasketByName(dbUser.getLogin() + "Basket" + dbUser.getBasketNumber());
        basket.setPaid("paid");
        subtractionSoldPhones(basket);
        String ip = request.getRemoteAddr();
        GregorianCalendar gc = new GregorianCalendar();
        Date orderDate = gc.getTime();
        Order order = new Order(dbUser, basket, delMethod, delAddress, ip, orderDate, OrderStatus.NOTFULFILLED);
        orderService.saveOrder(order);
        basketService.saveBasket(basket);
        dbUser.setBasketNumber(dbUser.getBasketNumber() + 1);
        userService.updateUser(dbUser);
        Basket bas = new Basket(dbUser.getLogin() + "Basket" + dbUser.getBasketNumber(), dbUser);
        basketService.saveBasket(bas);
        return "redirect:/";
    }

    private void subtractionSoldPhones(Basket basket) {
        for (MobilePhone phone : basket.getPhones()) {
            phone.getMobile().delete();
            phone.setStatus(PhoneStatus.SOLD);
            mobilePhoneService.saveMobilePhone(phone);
        }
    }

    private CustomUser getCustomUser() {
        CustomUser dbUser = null;
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        dbUser = userService.getUserByLogin(login);
        return dbUser;
    }

    private boolean checkAbsentMobilePhones(Mobile mobile) {
        List<MobilePhone> mobilePhones = mobilePhoneService.findByBasketIsNullAndMobile(mobile);
        return mobilePhones.isEmpty();
    }
}