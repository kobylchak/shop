package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.shop.dao.Brand;
import ua.shop.dao.Mobile;
import ua.shop.service.BrandService;
import ua.shop.service.MobileService;

import java.util.List;

@Controller
@RequestMapping("/brand")
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class BrandController {

    private static final int ITEMS_PER_PAGE = 6;

    @Autowired
    private MobileService mobileService;

    @Autowired
    private BrandService brandService;

    @GetMapping
    public String brandAddPage() {
        return "brand_add_page";
    }

    @PostMapping
    public String brandAdd(@RequestParam String name) {
        if (checkExistBrandName(name)) return "redirect:/admin/mobile";
        brandService.addBrand(new Brand(name));
        return "redirect:/admin/mobile";
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
        return "mobile";
    }

    @ResponseBody
    @GetMapping("/all")
    public List<Brand> showAllBrands(){
        return brandService.findBrands();
    }

    private boolean checkExistBrandName(String name) {
        long countSameName = brandService.findBrands().stream()
                .filter(brand -> brand.checkName(name))
                .count();
        return countSameName != 0;
    }

    private long getPageCount(Brand brand) {
        long totalCount = mobileService.countByBrand(brand);
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }
}
