package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Brand;
import ua.shop.dao.Mobile;
import ua.shop.dao.impl.MobileRepository;

import java.util.List;

@Service
public class MobileService {
    @Autowired
    private MobileRepository mobileRepository;

    @Transactional
    public void addMobile(Mobile mobile) {
        mobileRepository.save(mobile);
    }

    @Transactional
    public void saveMobile(Mobile mobile) {
        mobileRepository.save(mobile);
    }

    @Transactional
    public void deleteMobiles(long[] idList) {
        for (long id : idList)
            mobileRepository.deleteById(id);
    }

    @Transactional
    public Mobile findMobileById(long id) {
        return mobileRepository.getOne(id);
    }

    @Transactional(readOnly = true)
    public List<Mobile> findAll(Pageable pageable) {
        return mobileRepository.findAll(pageable).getContent();
    }

    @Transactional(readOnly = true)
    public List<Mobile> findAll() {
        return mobileRepository.findAll();
    }

    @Transactional(readOnly = true)
    public List<Mobile> findByBrand(Brand brand, Pageable pageable) {
        return mobileRepository.findByBrand(brand, pageable);
    }

    @Transactional(readOnly = true)
    public long countByBrand(Brand brand) {
        return mobileRepository.countByBrand(brand);
    }

    @Transactional(readOnly = true)
    public List<Mobile> findByPattern(String pattern, Pageable pageable) {
        return mobileRepository.findByPattern(pattern, pageable);
    }

    @Transactional
    public List<Mobile> findMobilesByPattern(String pattern){
        return mobileRepository.findMobilesByNameContains(pattern);
    }

    @Transactional(readOnly = true)
    public long count() {
        return mobileRepository.count();
    }
    }