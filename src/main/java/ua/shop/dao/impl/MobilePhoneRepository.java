package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.shop.dao.Mobile;
import ua.shop.dao.MobilePhone;
import ua.shop.dao.PhoneStatus;

import java.util.List;

public interface MobilePhoneRepository extends JpaRepository<MobilePhone, Long> {

    MobilePhone findById(long id);


//    MobilePhone getFirstByBasketIsNullAndMobile(Mobile mobile);
    MobilePhone getFirstByMobileAndStatus(Mobile mobile, PhoneStatus status);

//    MobilePhone getFirstByMobileAndStatus(Mobile mobile, String status);
//    MobilePhone getMobilePhoneByMobileAndStatus(Mobile mobile, String status);

    List<MobilePhone> findMobilePhonesByStatus(PhoneStatus status);

    List<MobilePhone> findByBasketIsNullAndMobile(Mobile mobile);




}
