package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.Mobile;
import ua.shop.dao.Order;
import ua.shop.dao.OrderStatus;
import ua.shop.service.*;

import java.util.Date;
import java.util.GregorianCalendar;
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
    private BasketService basketService;
    @Autowired
    private OrderService orderService;

    @RequestMapping
    public String getNotFulfilledOrders(Model model) {

        List<Order> notFulfilledOrders = orderService.findNotFulfilledOrders();
        if (notFulfilledOrders.isEmpty())
            model.addAttribute("emp", "emp");
        model.addAttribute("orders", notFulfilledOrders);
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

    @RequestMapping("/orders")
    public String getOrders(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<Order> orders = orderService.findAllOrders(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
//                mobileService
//                .findAll(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
//        model.addAttribute("brands", brandService.findBrands());
        model.addAttribute("allPages", getPageCount());
        model.addAttribute("orders", orders);
        return "admin";
    }

    @GetMapping("/orders/sent")
    public String getSentOrders(Model model) {
        List<Order> sentOrders = orderService.findSentOrders();
        model.addAttribute("orders", sentOrders);
        return "admin";
    }

    @GetMapping("/orders/returned")
    public String getReturnedOrders(Model model) {
        List<Order> returnedOrders = orderService.findReturnedOrders();
        model.addAttribute("orders", returnedOrders);
        return "admin";
    }

    @GetMapping("/orders/declaration/{order.id}")
    public String recordNumberDeclaration(Model model,
                                          @PathVariable(value = "order.id") long orderId) {
        Order order = orderService.findById(orderId);
        model.addAttribute("order", order);
        return "order_record_declaration";
    }

    @PostMapping("/orders/declaration")
    public String recordNumber(@RequestParam long orderId,
                               @RequestParam String declaration) {
        Order order = orderService.findById(orderId);
        order.setDeclarationNumber(declaration);
        order.setStatus(OrderStatus.SENT);
        GregorianCalendar gc = new GregorianCalendar();
        Date dateDispatch = gc.getTime();
        order.setDateDispatch(dateDispatch);
        orderService.saveOrder(order);
        return "redirect:/admin";
    }


    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model,
                         @RequestParam String pattern) {

        model.addAttribute("brands", brandService.findBrands());
        model.addAttribute("mobiles", mobileService.findMobilesByPattern(pattern));
//        model.addAttribute("mobiles", mobileService.findByPattern(pattern, null));
        return "mobile";
    }

    private long getPageCount() {
        long totalCount = orderService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}
