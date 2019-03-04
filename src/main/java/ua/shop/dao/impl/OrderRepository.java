package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.shop.dao.CustomUser;
import ua.shop.dao.Order;
import ua.shop.dao.OrderStatus;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    Order findById(long id);

    List<Order> findOrderById(long id);

    List<Order> findOrdersByStatus(OrderStatus status);

    List<Order> findOrdersByUser(CustomUser user);

}