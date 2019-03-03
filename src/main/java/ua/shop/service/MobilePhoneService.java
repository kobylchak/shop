package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Mobile;
import ua.shop.dao.MobilePhone;
import ua.shop.dao.impl.MobilePhoneRepository;

import java.util.List;

@Service
public class MobilePhoneService {
    @Autowired
    private MobilePhoneRepository mobilePhoneRepository;

    @Transactional
    public void saveMobilePhone(MobilePhone mobilePhone){
        mobilePhoneRepository.save(mobilePhone);
    }

    @Transactional
    public MobilePhone findMobilePhoneById(long id){
        return mobilePhoneRepository.findById(id);
    }

    @Transactional
    public MobilePhone getFirstByBasketIsNullAndMobile(Mobile mobile){
        return mobilePhoneRepository.getFirstByBasketIsNullAndMobile(mobile);
    }

    @Transactional
    public List<MobilePhone> findByBasketIsNullAndMobile(Mobile mobile){
        return mobilePhoneRepository.findByBasketIsNullAndMobile(mobile);
    }
}