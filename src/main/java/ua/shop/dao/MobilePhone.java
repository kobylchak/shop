package ua.shop.dao;

import javax.persistence.*;

@Entity
@Table(name = "MobilePhones")
public class MobilePhone {
    @Id
    @GeneratedValue
    @Column(name = "mobilephone_id")
    private long id;
    private String imei;
    @ManyToOne
    @JoinColumn(name = "mobile_id")
    private Mobile mobile;
    @ManyToOne
    @JoinColumn(name = "basket_id")
    private Basket basket;

    public MobilePhone(String imei, Mobile mobile) {
        this.imei = imei;
        this.mobile = mobile;
    }

    public MobilePhone() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getImei() {
        return imei;
    }

    public void setImei(String imei) {
        this.imei = imei;
    }

    public Mobile getMobile() {
        return mobile;
    }

    public void setMobile(Mobile mobile) {
        this.mobile = mobile;
    }

    public Basket getBasket() {
        return basket;
    }

    public void setBasket(Basket basket) {
        this.basket = basket;
    }
}
