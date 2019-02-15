package ua.shop.dao;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Brands")
public class Brand {
    @Id
    @GeneratedValue
    private long id;
    @NotNull(message = "Name cannot be null")
    private String name;
    @OneToMany(mappedBy = "brand", cascade = CascadeType.ALL)
    private List<Product> brands = new ArrayList<>();

    public Brand(String name) {
        this.name = name;
    }

    public Brand() {
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

    public List<Product> getBrands() {
        return brands;
    }

    public void setBrands(List<Product> brands) {
        this.brands = brands;
    }
}
