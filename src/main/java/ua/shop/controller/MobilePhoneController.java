package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.Brand;
import ua.shop.dao.Mobile;
import ua.shop.dao.MobilePhone;
import ua.shop.service.BrandService;
import ua.shop.service.MobilePhoneService;
import ua.shop.service.MobileService;

import java.util.List;

@Controller
@RequestMapping("/mobilephone")
public class MobilePhoneController {
    @Autowired
    private MobilePhoneService mobilePhoneService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private MobileService mobileService;

    @GetMapping("/{brand.id}")
    public String addMobilePhone(Model model,
                                 @PathVariable(value = "brand.id") long brandId){
        Brand brand = brandService.findBrandById(brandId);
        List<Mobile> mobiles = mobileService.findByBrand(brand, Pageable.unpaged());
        model.addAttribute("mobiles", mobiles);
        return "mobilephone_add_page";
    }

    @PostMapping
    public String addMobile(@RequestParam(value = "mobile") long mobileId,
                            @RequestParam String imei){
        Mobile mobile = mobileService.findMobileById(mobileId);
        MobilePhone mobilePhone = new MobilePhone(imei, mobile);
        mobile.add();
        mobilePhoneService.saveMobilePhone(mobilePhone);
        return "redirect:/admin/mobile";
    }

}
