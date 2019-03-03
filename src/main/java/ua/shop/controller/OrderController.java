package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.shop.dao.Order;
import ua.shop.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/order")
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping("/ip")
    public String processData(Model model, HttpServletRequest request) {
        String ipka = request.getRemoteAddr();
        model.addAttribute("ipka", ipka);
        return "ipka";
    }

//    @GetMapping
//    public String getOrders(Model model){
//        List<Order> notFulfilledOrders = orderService.findNotFulfilledOrders();
//        model.addAttribute("orders", notFulfilledOrders);
//        return "admin";
//    }
}
