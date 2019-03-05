package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.Brand;
import ua.shop.dao.Mobile;
import ua.shop.dao.MobilePhone;
import ua.shop.dao.PhoneStatus;
import ua.shop.service.BrandService;
import ua.shop.service.MobilePhoneService;
import ua.shop.service.MobileService;

import java.util.List;

@Controller
@RequestMapping("/mobilephone")
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class MobilePhoneController {
    private static final int ITEMS_PER_PAGE = 10;
    @Autowired
    private MobilePhoneService mobilePhoneService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private MobileService mobileService;

    @PostMapping
    public String addMobile(@RequestParam(value = "mobile") long mobileId,
                            @RequestParam String imei) {
        Mobile mobile = mobileService.findMobileById(mobileId);
        MobilePhone mobilePhone = new MobilePhone(imei, mobile);
        mobile.add();
        mobilePhoneService.saveMobilePhone(mobilePhone);
        return "redirect:/admin/mobile";
    }

    @GetMapping("/{brand.id}")
    public String addMobilePhone(Model model,
                                 @PathVariable(value = "brand.id") long brandId) {
        Brand brand = brandService.findBrandById(brandId);
        List<Mobile> mobiles = mobileService.findByBrand(brand, Pageable.unpaged());
        model.addAttribute("mobiles", mobiles);
        return "mobilephone_add_page";
    }

    @GetMapping
    public String getPhones(Model model,
                            @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;
        List<MobilePhone> phones = mobilePhoneService
                .findAll(new PageRequest(page, ITEMS_PER_PAGE, Sort.Direction.DESC, "id"));
        model.addAttribute("phones", phones);
        model.addAttribute("brands", brandService.findBrands());
        model.addAttribute("allPages", getPageCount());
        return "phone";
    }

    @GetMapping("/forsale")
    public String getForsalePhones(Model model){
        List<MobilePhone> phones = mobilePhoneService.findPhonesByStatus(PhoneStatus.FORSALE);
        model.addAttribute("phones", phones);
        return "phone";
    }

    @GetMapping("/inbasket")
    public String getInBasketPhones(Model model){
        List<MobilePhone> phones = mobilePhoneService.findPhonesByStatus(PhoneStatus.INBASKET);
        model.addAttribute("phones", phones);
        return "phone";
    }

    @GetMapping("/sold")
    public String getSoldPhones(Model model){
        List<MobilePhone> phones = mobilePhoneService.findPhonesByStatus(PhoneStatus.SOLD);
        model.addAttribute("phones", phones);
        return "phone";
    }

     @GetMapping("/returned")
    public String getReturnedPhones(Model model){
        List<MobilePhone> phones = mobilePhoneService.findPhonesByStatus(PhoneStatus.RETURNED);
        model.addAttribute("phones", phones);
        return "phone";
    }

    private long getPageCount() {
        long totalCount = mobilePhoneService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }

}
