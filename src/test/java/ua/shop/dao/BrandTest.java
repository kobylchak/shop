package ua.shop.dao;

import org.junit.Test;

import static org.junit.Assert.*;

public class BrandTest {

    @Test
    public void checkName() {
        Brand brand = new Brand();
        brand.setName("apple");
        Boolean result = brand.checkName("apple");
        assertTrue(result);
    }
}