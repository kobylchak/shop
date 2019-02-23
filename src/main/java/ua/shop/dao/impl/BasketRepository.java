package ua.shop.dao.impl;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.shop.dao.Basket;
import ua.shop.dao.CustomUser;

import java.util.List;

public interface BasketRepository extends JpaRepository<Basket, Long> {

    @Query("SELECT b FROM Basket b WHERE b.us = :us")
    List<Basket> findByUs(@Param("us")CustomUser us);

    Basket findBasketByName(String name);
    Basket findById(long id);


}
