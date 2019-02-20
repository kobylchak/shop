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


    @ManyToMany(mappedBy = "baskets", cascade = CascadeType.ALL)
    private List<Mobile> mobiles = new ArrayList<>();

    public Basket(String name) {
        this.name = name;
    }

    public Basket() {
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
}
