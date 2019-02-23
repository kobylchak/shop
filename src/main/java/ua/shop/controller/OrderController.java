package ua.shop.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/order")
//@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class OrderController {

    @GetMapping("/ip")
    public String processData(Model model, HttpServletRequest request) {
        String ipka = request.getRemoteAddr();
        model.addAttribute("ipka", ipka);
        return "ipka";
    }



}
