package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.shop.dao.CustomUser;
import ua.shop.service.MobileService;
import ua.shop.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/users")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

    @Autowired
    private MobileService mobileService;

    @Autowired
    private UserService userService;

    @GetMapping
    public String findUsers(Model model){
        List<CustomUser> users = userService.findAllCustomUser();
        model.addAttribute("users", users);
        return "users_page";
    }

    @PostMapping("/delete")
    public ResponseEntity<Void> deleteUser(@RequestParam(value = "toDo[]", required = false) long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
            userService.deleteUser(toDelete);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
