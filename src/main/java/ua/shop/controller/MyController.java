package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.shop.dao.*;
import ua.shop.exception.PhotoErrorException;
import ua.shop.exception.PhotoNotFoundException;
import ua.shop.service.PhotoService;
import ua.shop.service.ProductService;
import ua.shop.service.UserService;

import java.io.IOException;
import java.util.List;

@Controller
public class MyController {
    private static final int DEFAULT_BRAND_ID = -1;
    private static final int DEFAULT_PRODUCT_ID = -1;
    private static final int ITEMS_PER_PAGE = 6;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Autowired
    private PhotoService photoService;

    @RequestMapping("/")
    public String index(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        if (login.equals("admin")) model.addAttribute("admin", "admin");
        else model.addAttribute("user", "user");
        CustomUser dbUser = userService.getUserByLogin(login);
        model.addAttribute("login", login);
        model.addAttribute("roles", user.getAuthorities());
        model.addAttribute("email", dbUser.getEmail());
        model.addAttribute("phone", dbUser.getPhone());
        return "index";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String email, @RequestParam(required = false) String phone) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();
        CustomUser dbUser = userService.getUserByLogin(login);
        dbUser.setEmail(email);
        dbUser.setPhone(phone);
        userService.updateUser(dbUser);
        return "redirect:/";
    }

    @RequestMapping(value = "/newuser", method = RequestMethod.POST)
    public String update(@RequestParam String login,
                         @RequestParam String password,
                         @RequestParam(required = false) String email,
                         @RequestParam(required = false) String phone,
                         Model model) {
        if (userService.existsByLogin(login)) {
            model.addAttribute("exists", true);
            return "register";
        }
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String passHash = passwordEncoder.encode(password);
        CustomUser dbUser = new CustomUser(login, passHash, UserRole.USER, email, phone);
        userService.addUser(dbUser);
        return "redirect:/";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/forgot")
    public String forgot() {
        return "forgot";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("login", user.getUsername());
        return "unauthorized";
    }

    @RequestMapping("/admin")
    public String admin(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<Product> products = productService
                .findAll(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("brands", productService.findBrands());
        model.addAttribute("allPages", getPageCount());
        model.addAttribute("products", products);
        return "admin";
    }

    @RequestMapping("/brand_add_page")
    public String brandAddPage() {
        return "brand_add_page";
    }

    @RequestMapping("/photo_add_page")
    public String photoAddPage(Model model) {
        model.addAttribute("brands", productService.findBrands());
        return "photo_add_page";
    }

    @RequestMapping("/brand/{id}")
    public String listBrand(@PathVariable(value = "id") long brandId,
                            @RequestParam(required = false, defaultValue = "0") Integer page,
                            Model model) {
        Brand brand = (brandId != DEFAULT_BRAND_ID) ? productService.findBrand(brandId) : null;
        if (page < 0) page = 0;
        List<Product> products = productService.findByBrand(brand, new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("brands", productService.findBrands());
        model.addAttribute("products", products);
        model.addAttribute("byGroupPages", getPageCount(brand));
        model.addAttribute("brandId", brandId);
        return "admin";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(@RequestParam String pattern, Model model) {
        model.addAttribute("brands", productService.findBrands());
        model.addAttribute("products", productService.findByPattern(pattern, null));
        return "admin";
    }

    @PostMapping("/photo/delete")
    public ResponseEntity<Void> deletePhoto(@RequestParam(value = "toDeletePhoto[]", required = false) long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
            photoService.deletePhotos(toDelete);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/photo/add")
    public String photoAdd(Model model,
                           @RequestParam(value = "productId") long productId,
                           @RequestParam MultipartFile photo) {
        try {
            Product product = (productId != DEFAULT_PRODUCT_ID) ? productService.findProductById(productId) : null;
            product.getPhotos().add(new Photo(product, photo.getBytes()));
            productService.saveProduct(product);
            return "redirect:/admin";
        } catch (IOException ex) {
            throw new PhotoErrorException();
        }
    }

    @GetMapping("/download/photo/{product.id}")
    public String downloadPhoto(@PathVariable("product.id") long id,
                                Model model) {
        model.addAttribute("productId", id);
        return "photo_add_page";
    }

    @RequestMapping(value = "/brand/add", method = RequestMethod.POST)
    public String brandAdd(@RequestParam String name) {
        productService.addBrand(new Brand(name));
        return "redirect:/admin";
    }

    @RequestMapping("/photo/{photo.id}")
    public ResponseEntity<byte[]> onPhoto(@PathVariable("photo.id") long id) {
        return photoById(id);
    }

    private ResponseEntity<byte[]> photoById(long id) {
        Photo photo = photoService.findPhotoById(id);
        byte[] bytes = photo.getPhoto();
        if (bytes == null)
            throw new PhotoNotFoundException();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
    }


    private long getPageCount() {
        long totalCount = productService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }

    private long getPageCount(Brand brand) {
        long totalCount = productService.countByBrand(brand);
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}