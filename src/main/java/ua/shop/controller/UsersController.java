package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.CustomUser;
import ua.shop.service.BasketService;
import ua.shop.service.BrandService;
import ua.shop.service.MobileService;
import ua.shop.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UsersController {
    private static final int ITEMS_PER_PAGE = 6;

    @Autowired
    private UserService userService;

    @GetMapping
    public String getUsers(Model model,
                           @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<CustomUser> users = userService
                .findAllCustomUsersPage(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("users", users);
        model.addAttribute("allPages", getPageCount());
        return "users";
    }


    @PostMapping("/find")
    public String findUsersById(Model model,
                                @RequestParam(required = false, defaultValue = "0") long userId) {
        List<CustomUser> users = userService.findUsersById(userId);
        model.addAttribute("users", users);
        return "users";
    }

    @GetMapping("/order/{order.user.id}")
    public String findBasketById(Model model,
                                 @PathVariable(value = "order.user.id") long userId) {
        List<CustomUser> users = userService.findUsersById(userId);
        model.addAttribute("users", users);
        return "users";
    }

    @GetMapping("/basket/{basket.us.id}")
    public String findBasketsById(Model model,
                                  @PathVariable(value = "basket.us.id") long userId) {
        List<CustomUser> users = userService.findUsersById(userId);
        model.addAttribute("users", users);
        return "users";
    }

    @PostMapping("/delete")
    public ResponseEntity<Void> deleteUser(@RequestParam(value = "toDo[]", required = false) long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
            userService.deleteUser(toDelete);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    private long getPageCount() {
        long totalCount = userService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}
