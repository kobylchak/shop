package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.shop.dao.Basket;
import ua.shop.dao.BasketStatus;
import ua.shop.dao.CustomUser;

import java.util.List;

public interface BasketRepository extends JpaRepository<Basket, Long> {

    Basket findBasketById(long id);

    List<Basket> findBasketsById(long id);

    Basket findBasketByUsAndStatus(CustomUser user, BasketStatus status);

    Basket findByName(String name);

    List<Basket> findBasketByStatus(BasketStatus status);

}
