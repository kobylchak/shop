package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.shop.dao.Basket;
import ua.shop.dao.Mobile;

import java.util.List;

public interface BasketRepository extends JpaRepository<Basket, Long> {

//    @Query("SELECT m FROM Mobile m WHERE m.basket = :basket")
//    List<Mobile> findByBasket(@Param("basket") Basket basket);  //+++++++++++++++

    Basket findBasketByName(String name);


}
