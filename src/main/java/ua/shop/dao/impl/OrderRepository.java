package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.shop.dao.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
