package ua.shop.dao;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Baskets")
public class Basket {
    @Id
    @GeneratedValue
    private long id;

    private String name;
    private int totalQuantity;
    private double totalPrice;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private CustomUser us;

    @ManyToMany(mappedBy = "baskets", cascade = CascadeType.MERGE)
    private List<Mobile> mobiles = new ArrayList<>();

    @OneToMany(mappedBy = "basket", cascade = CascadeType.ALL)
    private List<Order> orders = new ArrayList<>();

    private String paid;

    public Basket(String name, CustomUser us) {
        this.name = name;
        this.us = us;
        this.paid = "not paid";
    }


    public CustomUser getUs() {
        return us;
    }

    public void setUs(CustomUser us) {
        this.us = us;
    }

    public Basket() {
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public double getTotalPrice() {
        double totalPrice = 0.0;
        for (Mobile mobile : mobiles) {
            totalPrice += mobile.getPrice();
        }
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<Mobile> getMobiles() {
        return mobiles;
    }

    public void setMobiles(List<Mobile> mobiles) {
        this.mobiles = mobiles;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }
}
