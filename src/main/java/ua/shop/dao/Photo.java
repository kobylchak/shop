package ua.shop.dao;

import javax.persistence.*;

@Entity
@Table(name = "Photos")
public class Photo {
    @Id
    @GeneratedValue
    private long id;

    @ManyToOne
    @JoinColumn(name = "mobile_id")
    private Mobile mobile;

    @Column(columnDefinition = "LONGBLOB NOT NULL")
    private byte[] photo;

    public Photo(Mobile mobile, byte[] photo) {
        this.mobile = mobile;
        this.photo = photo;
    }

    public Photo() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Mobile getMobile() {
        return mobile;
    }

    public void setMobile(Mobile mobile) {
        this.mobile = mobile;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
}
