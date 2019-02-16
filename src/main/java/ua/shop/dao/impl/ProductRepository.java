package ua.shop.dao.impl;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.shop.dao.Brand;
import ua.shop.dao.Product;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query("SELECT p FROM Product p WHERE p.brand = :brand")
    List<Product> findByBrand(@Param("brand") Brand brand, Pageable pageable);

    @Query("SELECT COUNT(p) FROM Product p WHERE p.brand = :brand")
    long countByBrand(@Param("brand") Brand brand);

    @Query("SELECT p FROM Product p WHERE LOWER(p.name) LIKE LOWER(CONCAT('%', :pattern, '%'))")
    List<Product> findByPattern(@Param("pattern") String pattern, Pageable pageable);

    Product findProductById(long id);
}
