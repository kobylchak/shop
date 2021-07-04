package ua.shop.dao;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Orders")
public class Order {
    @Id
    @GeneratedValue
    @Column(name = "order_id")
    private long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private CustomUser user;
    private String deliveryMethod;
    private String deliveryAddress;
    private String ipAddress;
    @Basic
    @Temporal(TemporalType.DATE)
    private Date orderDate;

    @Basic
    @Temporal(TemporalType.DATE)
    private Date dateDispatch;

//    @ManyToOne
//    @JoinColumn(name = "basket_id")
//    private Basket basket;

    @OneToOne
    @JoinColumn(name = "basket_id")
    private Basket basket;

    @JoinColumn(name = "declaration_number")
    private String declarationNumber;
    @Enumerated(EnumType.STRING)
    private OrderStatus status;

    public Order(CustomUser user, Basket basket, String deliveryMethod, String deliveryAddress, String ipAddress, Date orderDate, OrderStatus status) {
        this.user = user;
        this.basket = basket;
        this.deliveryMethod = deliveryMethod;
        this.deliveryAddress = deliveryAddress;
        this.ipAddress = ipAddress;
        this.status = status;
        this.orderDate = orderDate;
        this.declarationNumber = "-";
    }

    public Order() {
    }

    public Date getDateDispatch() {
        return dateDispatch;
    }

    public void setDateDispatch(Date dateDispatch) {
        this.dateDispatch = dateDispatch;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Basket getBasket() {
        return basket;
    }

    public void setBasket(Basket basket) {
        this.basket = basket;
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

    public String getDeclarationNumber() {
        return declarationNumber;
    }

    public void setDeclarationNumber(String declarationNumber) {
        this.declarationNumber = declarationNumber;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }
}

