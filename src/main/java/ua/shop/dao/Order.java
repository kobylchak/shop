package ua.shop.dao;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "Orders")
public class Order {
    @Id
    @GeneratedValue
    @Column(name = "order_id")          //         +++++++++++++++++++++++++++++++++++++
    private long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private CustomUser user;
    private String deliveryMethod;
    private String deliveryAddress;
    private String ipAddress;
    @ManyToOne
    @JoinColumn(name = "basket_id")
    private Basket basket;

    public Order(CustomUser user, Basket basket, String deliveryMethod, String deliveryAddress, String ipAddress) {
        this.user = user;
        this.basket = basket;
        this.deliveryMethod = deliveryMethod;
        this.deliveryAddress = deliveryAddress;
        this.ipAddress = ipAddress;
    }

    public Basket getBasket() {
        return basket;
    }

    public void setBasket(Basket basket) {
        this.basket = basket;
    }

    public Order() {
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public CustomUser getUser() {
        return user;
    }

    public void setUser(CustomUser user) {
        this.user = user;
    }

    public String getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(String deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }
}
