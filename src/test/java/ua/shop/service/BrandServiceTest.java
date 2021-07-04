package ua.shop.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import ua.shop.dao.Brand;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class BrandServiceTest {
    @Autowired
    private BrandService brandService;

    @Test
    public void addBrand() {
        Brand brand = new Brand();
        brand.setName("apple");
        brandService.addBrand(brand);
        Brand newBrand = brandService.findBrandById(brand.getId());
        assertNotNull(newBrand);
        assertEquals("apple", newBrand.getName());
    }
}