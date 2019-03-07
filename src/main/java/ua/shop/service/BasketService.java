package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Basket;
import ua.shop.dao.BasketStatus;
import ua.shop.dao.CustomUser;
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
        return basketRepository.findByName(name);
    }

    @Transactional
    public Basket findBasketById(long basketId) {
        return basketRepository.findBasketById(basketId);
    }

    @Transactional
    public List<Basket> findBasketsById(long basketId) {
        return basketRepository.findBasketsById(basketId);
    }

    @Transactional
    public List<Basket> findBaskets() {
        return basketRepository.findAll();
    }

    @Transactional
    public Basket findBasketByUserAndStatus(CustomUser user, BasketStatus status) {
        return basketRepository.findBasketByUsAndStatus(user, status);
    }

    @Transactional
    public List<Basket> findbaskets(Pageable pageable) {
        return basketRepository.findAll(pageable).getContent();
    }

    @Transactional
    public List<Basket> findBasketsByStatus(BasketStatus status) {
        return basketRepository.findBasketByStatus(status);
    }

    @Transactional
    public long count() {
        return basketRepository.count();
    }
}

