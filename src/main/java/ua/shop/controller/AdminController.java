package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.shop.dao.Mobile;
import ua.shop.dao.Order;
import ua.shop.service.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private static final int ITEMS_PER_PAGE = 6;
    @Autowired
    private BrandService brandService;
    @Autowired
    private UserService userService;
    @Autowired
    private MobileService mobileService;
    @Autowired
    private MobilePhoneService mobilePhoneService;
    @Autowired
    private BasketService basketService;
    @Autowired
    private OrderService orderService;

    @GetMapping
    public String getOrders(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<Order> orders = orderService.findAllOrders(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("allPages", getPageCount());
        model.addAttribute("orders", orders);
        return "admin";
    }

    @RequestMapping("/mobile")
    public String getMobiles(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<Mobile> mobiles = mobileService
                .findAll(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("brands", brandService.findBrands());
        model.addAttribute("allPages", getPageCount());
        model.addAttribute("mobiles", mobiles);
        return "mobile";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model,
                         @RequestParam String pattern) {

        model.addAttribute("brands", brandService.findBrands());
        model.addAttribute("mobiles", mobileService.findMobilesByPattern(pattern));
        return "mobile";
    }

    private long getPageCount() {
        long totalCount = orderService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}
