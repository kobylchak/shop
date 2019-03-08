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

    @GetMapping("/show/{basket.name}")
    public String showBasket(Model model,
                             @PathVariable (value = "basket.name") String basketName) {
        Basket basket = basketService.findBasketByName(basketName);
        model.addAttribute("basket", basket);
        return "basket";
    }

    @GetMapping("/{mobile.id}")
    public String addMobileToBasket(Model model,
                                    @PathVariable(value = "mobile.id") long mobileId) {
        Basket basket = basketService.findBasketByUserAndStatus(getCustomUser(), BasketStatus.NOT_PAID);
        Mobile mobile = mobileService.findMobileById(mobileId);
        if (checkAbsentMobilePhones(mobile)) return "redirect:/";
        MobilePhone mobilePhone = mobilePhoneService.getFirstMobilePhoneByMobileAndStatus(mobile, PhoneStatus.FORSALE);
        mobilePhone.setStatus(PhoneStatus.INBASKET);
        mobilePhoneService.saveMobilePhone(mobilePhone);
        mobilePhone.setBasket(basket);
        basket.getPhones().add(mobilePhone);
        GregorianCalendar gc = new GregorianCalendar();
        Date date = gc.getTime();
        basket.setPutInBasket(date);
        basket.setTotalPrice(basket.countTotalPrice());
        basket.setTotalQuantity(basket.countTotalQuantity());
        basket.setContent(true);
        basketService.saveBasket(basket);
//        model.addAttribute("basket", basket);
        return "redirect:/";
    }

    @GetMapping("/delete/{phone.id}")
    public String deleteMobileFromBasket(Model model,
                                         @PathVariable(value = "phone.id") long mobilePhoneId) {
        MobilePhone phone = mobilePhoneService.findMobilePhoneById(mobilePhoneId);
        phone.setStatus(PhoneStatus.FORSALE);
        mobilePhoneService.saveMobilePhone(phone);
        Basket basket = basketService.findBasketByUserAndStatus(getCustomUser(), BasketStatus.NOT_PAID);
        basket.getPhones().remove(phone);
        basket.setTotalPrice(basket.countTotalPrice());
        phone.setBasket(null);
        basket.setTotalQuantity(basket.countTotalQuantity());

        if (basket.getTotalQuantity() == 0) {
            basket.setPutInBasket(null);
            basket.setContent(false);
        }
        basketService.saveBasket(basket);
        model.addAttribute("basket", basket);
        return "basket";
    }

    @GetMapping("/buy")
    public String showBuy() {
        Basket basket = basketService.findBasketByName(createBasketName());
        if (basket.getPhones().isEmpty()) return "redirect:/";
        return "basket_buy_page";
    }

    @PostMapping("/buy")
    public String buyBasket(@RequestParam String delMethod,
                            @RequestParam String delAddress,
                            @RequestParam String phone,
                            HttpServletRequest request
    ) {
        CustomUser dbUser = getCustomUser();
        Basket basket = basketService.findBasketByName(createBasketName());
        basket.setStatus(BasketStatus.PAID);
        subtractionSoldPhones(basket);
        String ip = request.getRemoteAddr();
        GregorianCalendar gc = new GregorianCalendar();
        Date orderDate = gc.getTime();
        Order order = new Order(dbUser, basket, delMethod, delAddress, ip, orderDate, OrderStatus.NOTFULFILLED);
        orderService.saveOrder(order);
        basketService.saveBasket(basket);
        updateUserData(dbUser, delAddress, phone);
        createNewBasket();
        return "redirect:/";
    }

    private void subtractionSoldPhones(Basket basket) {
        for (MobilePhone phone : basket.getPhones()) {
            phone.getMobile().delete();

            phone.setStatus(PhoneStatus.SOLD);
            mobilePhoneService.saveMobilePhone(phone);
        }
    }

    private void updateUserData(CustomUser dbUser, String delAddress, String phone) {
        dbUser.setBasketNumber(dbUser.getBasketNumber() + 1);
        dbUser.setAddress(delAddress);
        dbUser.setPhone(phone);
        userService.updateUser(dbUser);
    }

    private CustomUser getCustomUser() {
        CustomUser dbUser = null;
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        dbUser = userService.getUserByLogin(login);
        return dbUser;
    }


    private void createNewBasket() {
        Basket bas = new Basket(createBasketName(), getCustomUser());
        basketService.saveBasket(bas);
    }

    private String createBasketName() {
        CustomUser dbUser = getCustomUser();
        return dbUser.getLogin() + "Basket" + dbUser.getBasketNumber();
    }

    private boolean checkAbsentMobilePhones(Mobile mobile) {
        List<MobilePhone> mobilePhones = mobilePhoneService.findByBasketIsNullAndMobile(mobile);
        return mobilePhones.isEmpty();
    }
}