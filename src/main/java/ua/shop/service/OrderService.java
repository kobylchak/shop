package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Order;
import ua.shop.dao.impl.OrderRepository;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Transactional
    public void addOrder(Order order){
        orderRepository.save(order);
    }

    @Transactional
    public void saveOrder(Order order){
        orderRepository.save(order);
    }

}
