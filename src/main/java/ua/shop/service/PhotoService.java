package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Photo;
import ua.shop.dao.PhotoRepository;
import ua.shop.dao.Product;
import ua.shop.dao.ProductRepository;

import java.util.List;

@Service
public class PhotoService {
    @Autowired
    private PhotoRepository photoRepository;

    @Autowired
    private ProductRepository productRepository;

    @Transactional
    public void savePhoto(Photo photo){
        photoRepository.save(photo);
    }
    @Transactional
    public Photo findPhotoById(long id){
        return photoRepository.getOne(id);

    }

    @Transactional
    public List<Product> findProducts(){
        return productRepository.findAll();
    }
}
