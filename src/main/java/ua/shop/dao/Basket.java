package ua.shop.dao;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Baskets")
public class Basket {
    @Id
    @GeneratedValue
    @Column(name = "basket_id")
    private long id;

    private String name;
    private int totalQuantity;
    private double totalPrice;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private CustomUser us;

    @OneToMany(mappedBy = "basket", cascade = CascadeType.ALL)
    private List<MobilePhone> phones = new ArrayList<>();

    @OneToMany(mappedBy = "basket", cascade = CascadeType.ALL)
    private List<Order> orders = new ArrayList<>();

    private String paid;

    public Basket(String name, CustomUser us) {
        this.name = name;
        this.us = us;
        this.paid = "not paid";
    }

    public Basket() {
    }

    public CustomUser getUs() {
        return us;
    }

    public void setUs(CustomUser us) {
        this.us = us;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<MobilePhone> getPhones() {
        return phones;
    }

    public void setPhones(List<MobilePhone> phones) {
        this.phones = phones;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }

    public double countTotalPrice() {
        double totalPrice = 0.0;
        for (MobilePhone phone : phones) {
            totalPrice += phone.getMobile().getPrice();
        }
        return totalPrice;
    }
    public int countTotalQuantity(){
        return phones.size();
    }
}
