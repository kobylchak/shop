package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.shop.dao.Basket;
import ua.shop.dao.CustomUser;

import java.util.List;

public interface BasketRepository extends JpaRepository<Basket, Long> {

    @Query("SELECT b FROM Basket b WHERE b.us = :us and b.paid = :paid")
    List<Basket> findByUsAndPaidEquals(@Param("us") CustomUser us, @Param("paid") String paid);

    Basket findBasketByUsAndPaid(CustomUser user, String paid);

    Basket findByName(String name);

}
