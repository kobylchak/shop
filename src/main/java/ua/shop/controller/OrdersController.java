package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.*;
import ua.shop.service.*;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

@Controller
@RequestMapping("/admin/orders")
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class OrdersController {
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

    @GetMapping("/sold")
    public String getSentOrders(Model model) {
        List<Order> soldOrders = orderService.findOrdersByStatus(OrderStatus.SOLD);
        model.addAttribute("soldOrdersEmpty", soldOrders.isEmpty());
        model.addAttribute("changeStatus", true);
        model.addAttribute("orders", soldOrders);
        return "admin";
    }

    @GetMapping("/returned")
    public String getReturnedOrders(Model model) {
        List<Order> returnedOrders = orderService.findReturnedOrders();
        model.addAttribute("returnedOrdersEmpty", returnedOrders.isEmpty());
        model.addAttribute("changeStatus", true);
        model.addAttribute("orders", returnedOrders);
        return "admin";
    }

    @GetMapping("/notfulfilled")
    public String getNotfulfilledOrders(Model model) {
        List<Order> notFulfilledOrders = orderService.findOrdersByStatus(OrderStatus.NOTFULFILLED);
        model.addAttribute("notFulfilledOrders", notFulfilledOrders.isEmpty());
        model.addAttribute("headNotfulfilledOrders", true);
        model.addAttribute("orders", notFulfilledOrders);
        return "admin";
    }

    @GetMapping("/declaration/{order.id}")
    public String recordNumberDeclaration(Model model,
                                          @PathVariable(value = "order.id") long orderId) {
        Order order = orderService.findById(orderId);
        model.addAttribute("order", order);
        return "order_record_declaration";
    }

    @PostMapping("/declaration")
    public String recordNumber(@RequestParam long orderId,
                               @RequestParam String declaration) {
        Order order = orderService.findById(orderId);
        order.setDeclarationNumber(declaration);
        order.setStatus(OrderStatus.SOLD);
        GregorianCalendar gc = new GregorianCalendar();
        Date dateDispatch = gc.getTime();
        order.setDateDispatch(dateDispatch);
        orderService.saveOrder(order);
        return "redirect:/admin";
    }

    @GetMapping("/status/{order.id}")
    public String getChangeStatusPage(Model model,
                                      @PathVariable(value = "order.id") long orderId) {
        Order order = orderService.findById(orderId);
        model.addAttribute("order", order);
        return "order_change_status";
    }

    @PostMapping("/status")
    public String changeStatusPage(Model model,
                                   @RequestParam long orderId,
                                   @RequestParam String status) {
        Order order = orderService.findById(orderId);
        OrderStatus orderStatus = OrderStatus.valueOf(status);
        PhoneStatus phoneStatus = PhoneStatus.valueOf(status);
        order.setStatus(orderStatus);
        Basket basket = order.getBasket();
        for (MobilePhone phone : basket.getPhones()) {
            phone.setStatus(phoneStatus);
            mobilePhoneService.saveMobilePhone(phone);
        }
        orderService.saveOrder(order);
        return "redirect:/admin";
    }

    @GetMapping("/status/change")
    public String getPosibilitiToChangeStatus(Model model){
        List<Order> orders = orderService.findOrdersByStatus(OrderStatus.RETURNED);
        List<Order> soldOrders = orderService.findOrdersByStatus(OrderStatus.SOLD);
        orders.addAll(soldOrders);
        model.addAttribute("orderMissing", orders.isEmpty());
        model.addAttribute("orders", orders);
        model.addAttribute("changeStatus", true);
        return "admin";
    }

    @PostMapping("/search")
    public String searchOrderById(Model model,
                                  @RequestParam(required = false, defaultValue = "0") long orderId) {
        List<Order> orders = orderService.findOrderById(orderId);
        model.addAttribute("orders", orders);
        return "admin";
    }

    @GetMapping("/search/{phone.basket.order.id}")
    public String searchOrdById(Model model,
                                  @PathVariable(value = "phone.basket.order.id") long orderId) {
        List<Order> orders = orderService.findOrderById(orderId);
        model.addAttribute("orders", orders);
        return "admin";
    }


    @GetMapping("/user/{order.user.login}")
    public String searchOrdersByUserLogin(Model model,
                                          @PathVariable(value = "order.user.login") String login) {
        CustomUser user = userService.getUserByLogin(login);
        List<Order> orders = orderService.findOrdersByUser(user);
        model.addAttribute("orders", orders);
        return "admin";
    }

    @PostMapping("/user")
    public String searchOrdersbyUser(Model model,
                                     @RequestParam(required = false, defaultValue = "+") String login){
        CustomUser user = userService.getUserByLogin(login);
        List<Order> orders = orderService.findOrdersByUser(user);
        model.addAttribute("orders", orders);
        return "admin";
    }

    private long getPageCount() {
        long totalCount = orderService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}
