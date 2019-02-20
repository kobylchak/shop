package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Basket;
import ua.shop.dao.impl.BasketRepository;

import java.util.List;

@Service
public class BasketService {
    @Autowired
    private BasketRepository basketRepository;

    @Transactional
    public void saveBasket(Basket basket) {
        basketRepository.save(basket);
    }

    @Transactional
    public Basket findBasketByName(String name) {
        return basketRepository.findBasketByName(name);
    }

    @Transactional
    public Basket findBasketById(long basketId) {
        return basketRepository.getOne(basketId);
    }

    @Transactional
    public List<Basket> findBaskets() {
        return basketRepository.findAll();
    }
}

