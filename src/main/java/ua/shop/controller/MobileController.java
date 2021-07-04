package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.Brand;
import ua.shop.dao.Mobile;
import ua.shop.service.BrandService;
import ua.shop.service.MobileService;

import java.util.List;

@Controller
@RequestMapping("/mobile")
public class MobileController {
    private static final int ITEMS_PER_PAGE = 6;
    @Autowired
    private BrandService brandService;

    @Autowired
    private MobileService mobileService;


    @GetMapping
    public String getMobiles(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<Mobile> mobiles = mobileService
                .findAll(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("brands", brandService.findBrands());
        model.addAttribute("pages", getPageCount());
        model.addAttribute("mobiles", mobiles);
        return "mobile";
    }

    @GetMapping("/page")
    public String mobileAddPage(Model model) {
        model.addAttribute("brands", brandService.findBrands());
        return "mobile_add_page";
    }

    @PostMapping
    public String mobileAdd( @RequestParam(value = "brand") long brandId,
                             @RequestParam String name,
                             @RequestParam Double price,
                             @RequestParam String color,
                             @RequestParam String description,
                             @RequestParam int discount) {
        Brand brand = brandService.findBrandById(brandId);
        Mobile mob = new Mobile(brand, name, price, color, description, discount);
        mobileService.addMobile(mob);
        return "redirect:/mobile";
    }

    @GetMapping("/description/{mobile.id}")
    public String description(Model model,
                              @PathVariable(value = "mobile.id") long mobileId) {
        Mobile mobile = mobileService.findMobileById(mobileId);
        model.addAttribute("mobile", mobile);
        return "mobile_change_description";
    }

    @PostMapping("/description")
    public String changeDescription(@RequestParam long mobileId,
                                    @RequestParam String newDescription) {
        Mobile mobile = mobileService.findMobileById(mobileId);
        mobile.setDescription(newDescription);
        mobileService.saveMobile(mobile);
        return "redirect:/mobile";
    }

    @PostMapping("/delete")
    public ResponseEntity<Void> deleteMobile(@RequestParam(value = "toDo[]", required = false) long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
            mobileService.deleteMobiles(toDelete);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/change_price")
    public ResponseEntity<Void> changePrice(@RequestParam(required = false) double newPrice,
                                            @RequestParam(value = "toDo[]", required = false) long[] toChange) {
        if (toChange != null && toChange.length > 0) {
            for (long id : toChange) {
                Mobile mobile = mobileService.findMobileById(id);
                mobile.setPrice(newPrice);
                mobileService.saveMobile(mobile);
            }
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/change_discount")
    public ResponseEntity<Void> changeDiscount(
            @RequestParam(required = false) int newDiscount,
            @RequestParam(value = "toDo[]", required = false) long[] toChange) {
        if (toChange != null && toChange.length > 0) {
            for (long id : toChange) {
                Mobile mobile = mobileService.findMobileById(id);
                mobile.setDiscount(newDiscount);
                mobileService.saveMobile(mobile);
            }
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/{phone.mobile.id}")
    public String findMobileById(Model model,
                                 @PathVariable(value = "phone.mobile.id") long mobileId){
        List<Mobile> mobiles = mobileService.findMobilesById(mobileId);
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
        long totalCount = mobileService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}
