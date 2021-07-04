package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Photo;
import ua.shop.dao.impl.PhotoRepository;
import ua.shop.dao.Mobile;
import ua.shop.dao.impl.MobileRepository;

import java.util.List;

@Service
public class PhotoService {
    @Autowired
    private PhotoRepository photoRepository;

    @Autowired
    private MobileRepository mobileRepository;

    @Transactional
    public void savePhoto(Photo photo) {
        photoRepository.save(photo);
    }

    @Transactional
    public Photo findPhotoById(long id) {
        return photoRepository.getOne(id);
    }

    @Transactional
    public List<Mobile> findProducts() {
        return mobileRepository.findAll();
    }

    @Transactional
    public void deletePhotos(long[] idList) {
        for (long id : idList)
            photoRepository.deleteById(id);
    }
}
