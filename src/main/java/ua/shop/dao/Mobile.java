package ua.shop.dao;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "Mobiles")
public class Mobile {
    @Id
    @GeneratedValue
    private long id;
    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;
    private String name;
    @OneToMany(mappedBy = "mobile", cascade = CascadeType.ALL)
    private List<Photo> photos = new ArrayList<>();
    private int price;
    private String color;
    private String description;
    private int discount;
    @ManyToMany
    @JoinTable(
            name = "MobileBasket",
            joinColumns = @JoinColumn(name = "mob_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "basket_id", referencedColumnName = "id"))
    private List<Basket> baskets = new ArrayList<>();

    public Mobile() {
    }

    public Mobile(Brand brand, String name, int price, String color, String description, int discount, List<Basket> baskets) {
        this.brand = brand;
        this.name = name;
        this.price = price;
        this.color = color;
        this.description = description;
        this.discount = discount;
        this.baskets = baskets;
    }

    public List<Basket> getBaskets() {
        return baskets;
    }

    public void setBaskets(List<Basket> baskets) {
        this.baskets = baskets;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Photo> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Mobile mobile = (Mobile) o;
        return id == mobile.id &&
                price == mobile.price &&
                Objects.equals(brand, mobile.brand) &&
                Objects.equals(name, mobile.name) &&
                Objects.equals(color, mobile.color) &&
                Objects.equals(description, mobile.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, brand, name, price, color, description);
    }
}
