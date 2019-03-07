package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.Basket;
import ua.shop.dao.BasketStatus;
import ua.shop.dao.MobilePhone;
import ua.shop.dao.PhoneStatus;
import ua.shop.service.BasketService;
import ua.shop.service.MobilePhoneService;

import java.util.List;

@Controller
@RequestMapping("/baskets")
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class BasketsController {
    private static final int ITEMS_PER_PAGE = 10;
    @Autowired
    private BasketService basketService;
    @Autowired
    private MobilePhoneService mobilePhoneService;

    @GetMapping
    public String getBasketsPage(Model model,
                                 @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<Basket> baskets = basketService
                .findbaskets(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("baskets", baskets);
        model.addAttribute("allPages", getPageCount());
        return "baskets";
    }

    @PostMapping("/find")
    public String findBasketsById(Model model,
                                  @RequestParam(required = false, defaultValue = "0") long basketId) {
        List<Basket> baskets = basketService.findBasketsById(basketId);
        model.addAttribute("baskets", baskets);
        return "baskets";
    }

    @GetMapping("/find/{order.basket.id}")
    public String findBasketById(Model model,
                                 @PathVariable(value = "order.basket.id") long basketId) {
        List<Basket> baskets = basketService.findBasketsById(basketId);
        model.addAttribute("baskets", baskets);
        return "baskets";
    }

    @GetMapping("/paid")
    public String findPaidBaskets(Model model) {
        List<Basket> baskets = basketService.findBasketsByStatus(BasketStatus.PAID);
        model.addAttribute("baskets", baskets);
        return "baskets";
    }

    @GetMapping("/notpaid")
    public String findNotpaidBaskets(Model model) {
        List<Basket> baskets = basketService.findBasketsByStatus(BasketStatus.NOT_PAID);
        model.addAttribute("baskets", baskets);
        model.addAttribute("clearPosibility", true);
        return "baskets";
    }

    @GetMapping("/clear/{basket.id}")
    public String clearBasket(Model model,
                              @PathVariable(value = "basket.id") long basketId) {
        Basket basket = basketService.findBasketById(basketId);
        for (MobilePhone phone : basket.getPhones()) {
            phone.setStatus(PhoneStatus.FORSALE);
            phone.setBasket(null);
            mobilePhoneService.saveMobilePhone(phone);
        }
        basket.getPhones().clear();
        basket.setTotalPrice(basket.countTotalPrice());
        basket.setTotalQuantity(basket.countTotalQuantity());
        basket.setPutInBasket(null);
        basketService.saveBasket(basket);
        return "baskets";
    }

    private long getPageCount() {
        long totalCount = basketService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}