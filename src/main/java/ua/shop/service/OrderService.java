package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Order;
import ua.shop.dao.OrderStatus;
import ua.shop.dao.impl.OrderRepository;

import java.util.List;

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

    @Transactional
    public Order findById(long id){
        return orderRepository.findById(id);
    }

    @Transactional
    public List<Order> findOrders(){
        return orderRepository.findAll();
    }

    @Transactional
    public List<Order> findAllOrders(Pageable pageable){
        return orderRepository.findAll(pageable).getContent();
    }

    @Transactional(readOnly = true)
    public long count() {
        return orderRepository.count();
    }

    @Transactional
    public List<Order> findNotFulfilledOrders(){
        return orderRepository.findOrdersByStatus(OrderStatus.NOTFULFILLED);
    }
    @Transactional
    public List<Order> findSentOrders(){
        return orderRepository.findOrdersByStatus(OrderStatus.SENT);
    }
    @Transactional
    public List<Order> findReturnedOrders(){
        return orderRepository.findOrdersByStatus(OrderStatus.RETURNED);
    }

}
