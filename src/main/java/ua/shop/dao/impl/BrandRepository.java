package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.shop.dao.Brand;

public interface BrandRepository extends JpaRepository<Brand, Long> {
    Brand findById(long id);

    Brand findByName(String name);
}
