package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.shop.dao.Mobile;
import ua.shop.dao.MobilePhone;

import java.util.List;

public interface MobilePhoneRepository extends JpaRepository<MobilePhone, Long> {

    MobilePhone findById(long id);

    MobilePhone getFirstByBasketIsNullAndMobile(Mobile mobile);

    List<MobilePhone> findByBasketIsNullAndMobile(Mobile mobile);

}
