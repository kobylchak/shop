package ua.shop.dao.impl;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.shop.dao.Brand;
import ua.shop.dao.Mobile;

import java.util.List;

public interface MobileRepository extends JpaRepository<Mobile, Long> {
    @Query("SELECT m FROM Mobile m WHERE m.brand = :brand")
    List<Mobile> findByBrand(@Param("brand") Brand brand, Pageable pageable);

    @Query("SELECT COUNT(m) FROM Mobile m WHERE m.brand = :brand")
    long countByBrand(@Param("brand") Brand brand);

    @Query("SELECT m FROM Mobile m WHERE LOWER(m.name) LIKE LOWER(CONCAT('%', :pattern, '%'))")
    List<Mobile> findByPattern(@Param("pattern") String pattern, Pageable pageable);

    List<Mobile> findMobilesByNameContains(String pattern);
}