package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.shop.dao.Basket;

public interface BasketRepository extends JpaRepository<Basket, Long> {

    Basket findBasketByName(String name);
    Basket findById(long id);

}
