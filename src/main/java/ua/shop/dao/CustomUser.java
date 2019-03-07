package ua.shop.dao;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "Users")
public class CustomUser {
    @Id
    @GeneratedValue
    private long id;
    private String login;
    private String password;
    @Enumerated(EnumType.STRING)
    private UserRole role;
    private String name;
    private String surname;
    private String email;
    private String phone;
    private String address;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Order> orders = new ArrayList<>();

    @OneToMany(mappedBy = "us", cascade = CascadeType.ALL)
    private List<Basket> baskets = new ArrayList<>();
    private int basketNumber;

    public CustomUser(String login, String password, UserRole role, String email, List<Basket> baskets) {
        this.login = login;
        this.password = password;
        this.role = role;
        this.email = email;
        this.baskets = baskets;
    }

    public CustomUser(String login, String password, UserRole role, String name, String surname, String email, List<Basket> baskets) {
        this.login = login;
        this.password = password;
        this.role = role;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.baskets = baskets;
    }

    public CustomUser() {
    }

    public List<Basket> getBaskets() {
        return baskets;
    }

    public void setBaskets(List<Basket> baskets) {
        this.baskets = baskets;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public int getBasketNumber() {
        return this.basketNumber;
    }

    public void setBasketNumber(int basketNumber) {
        this.basketNumber = basketNumber;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CustomUser that = (CustomUser) o;
        return id == that.id &&
                Objects.equals(login, that.login) &&
                Objects.equals(password, that.password) &&
                role == that.role &&
                Objects.equals(email, that.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, login, password, role, email);
    }
}