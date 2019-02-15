package ua.shop.dao;

import javax.persistence.*;
import java.util.Arrays;
import java.util.Objects;

@Entity
@Table(name = "Products")
public class Product {
    @Id
    @GeneratedValue
    private long id;
    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;
    private String product;

    @Column(columnDefinition = "LONGBLOB NOT NULL")
    private byte[] photo;
    private int price;
    private String color;
    private String description;
    private int discount;


    public Product() {
    }

    public Product(Brand brand, String product, byte[] photo, int price, String color, String description, int discount) {
        this.brand = brand;
        this.product = product;
        this.photo = photo;
        this.price = price;
        this.color = color;
        this.description = description;
        this.discount = discount;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
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

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
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
        Product product1 = (Product) o;
        return id == product1.id &&
                price == product1.price &&
                Objects.equals(brand, product1.brand) &&
                Objects.equals(product, product1.product) &&
                Arrays.equals(photo, product1.photo) &&
                Objects.equals(color, product1.color) &&
                Objects.equals(description, product1.description);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(id, brand, product, price, color, description);
        result = 31 * result + Arrays.hashCode(photo);
        return result;
    }
}
