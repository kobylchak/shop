package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.Brand;
import ua.shop.dao.Mobile;
import ua.shop.service.MobileService;

@Controller
@RequestMapping("/mobile")
//@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
public class MobileController {

    @Autowired
    private MobileService mobileService;

    @GetMapping
    public String mobileAddPage(Model model) {
        model.addAttribute("brands", mobileService.findBrands());
        return "mobile_add_page";
    }

    @PostMapping("/add")
    public String mobileAdd(Model model,
                             @RequestParam(value = "brand") long brandId,
                             @RequestParam String name,
                             @RequestParam Double price,
                             @RequestParam String color,
                             @RequestParam String description,
                             @RequestParam int discount) {
        Brand brand = mobileService.findBrand(brandId);
        Mobile mob = new Mobile(brand, name, price, color, description, discount, null);
        mobileService.addMobile(mob);
        return "redirect:/admin";
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
        return "redirect:/admin";
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


}
