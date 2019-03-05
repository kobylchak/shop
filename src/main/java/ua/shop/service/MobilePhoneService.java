package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Mobile;
import ua.shop.dao.MobilePhone;
import ua.shop.dao.PhoneStatus;
import ua.shop.dao.impl.MobilePhoneRepository;

import java.util.List;

@Service
public class MobilePhoneService {
    @Autowired
    private MobilePhoneRepository mobilePhoneRepository;

    @Transactional
    public void saveMobilePhone(MobilePhone mobilePhone) {
        mobilePhoneRepository.save(mobilePhone);
    }

    @Transactional
    public MobilePhone findMobilePhoneById(long id) {
        return mobilePhoneRepository.findById(id);
    }

    @Transactional(readOnly = true)
    public List<MobilePhone> findAll(Pageable pageable){
        return mobilePhoneRepository.findAll(pageable).getContent();
    }
//    @Transactional
//    public MobilePhone getFirstByBasketIsNullAndMobile(Mobile mobile){
//        return mobilePhoneRepository.getFirstByBasketIsNullAndMobile(mobile);
//    }

    @Transactional
    public MobilePhone getFirstMobilePhoneByMobileAndStatus(Mobile mobile, PhoneStatus status) {
        return mobilePhoneRepository.getFirstByMobileAndStatus(mobile, status);
    }

    @Transactional
    public List<MobilePhone> findByBasketIsNullAndMobile(Mobile mobile) {
        return mobilePhoneRepository.findByBasketIsNullAndMobile(mobile);
    }

    @Transactional
    public List<MobilePhone> findPhonesByStatus(PhoneStatus status){
        return mobilePhoneRepository.findMobilePhonesByStatus(status);
    }

//    @Transactional
//    public List<MobilePhone> findSoldAndReturnedPhones(){
//        return mobilePhoneRepository.findMobilePhonesByStatusAndStatus(PhoneStatus.SOLD, PhoneStatus.RETURNED);
//    }

//        @Transactional
//        public List<MobilePhone> findSoldAndReturnedPhones(){
//            return mobilePhoneRepository.
//        }

    @Transactional
    public List<MobilePhone> findPhoneByImei(String imei){
        return mobilePhoneRepository.findMobilePhoneByImei(imei);
    }

    @Transactional
    public long count(){return mobilePhoneRepository.count();}
}
