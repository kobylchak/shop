package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ua.shop.dao.*;
import ua.shop.service.BasketService;
import ua.shop.service.BrandService;
import ua.shop.service.MobileService;
import ua.shop.service.UserService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {
    private static final int ITEMS_PER_PAGE = 6;

    @Autowired
    private BrandService brandService;

    @Autowired
    private MobileService mobileService;

    @Autowired
    private BasketService basketService;

    @Autowired
    private UserService userService;


    @GetMapping
    public String findUsers(Model model) {
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

    @RequestMapping(value = "/newuser", method = RequestMethod.POST)
    public String update(@RequestParam String first,
                         @RequestParam String last,
                         @RequestParam String login,
                         @RequestParam String email,
                         @RequestParam String password,
                         RedirectAttributes redir,
                         Model model) {
        if (userService.existsByLogin(login)) {
            redir.addFlashAttribute("exists", true);
            return "redirect:/login";
        }
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String passHash = passwordEncoder.encode(password);
        List<Basket> baskets = new ArrayList<>();
        CustomUser dbUser = new CustomUser(login, passHash, UserRole.USER, email, baskets);
        userService.addUser(dbUser);
        String basketName = login + "Basket" + dbUser.getBasketNumber();
        Basket basket = new Basket(basketName, dbUser);
        basketService.saveBasket(basket);
        return "redirect:/";
    }

    @GetMapping("/{id}")
    public String findMobilesByBrand(@PathVariable(value = "id") long brandId,
                                     @RequestParam(required = false, defaultValue = "0") Integer page,
                                     Model model) {
        Brand brand = brandService.findBrandById(brandId);
        if (page < 0) page = 0;
        List<Mobile> mobiles = mobileService.findByBrand(brand, new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("brands", brandService.findBrands());
        model.addAttribute("mobiles", mobiles);
        model.addAttribute("byGroupPages", getPageCount(brand));
        model.addAttribute("brandId", brandId);
        return "index";
    }

    private long getPageCount(Brand brand) {
        long totalCount = mobileService.countByBrand(brand);
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }

}
