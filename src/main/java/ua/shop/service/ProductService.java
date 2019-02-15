package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.Brand;
import ua.shop.dao.BrandRepository;
import ua.shop.dao.Product;
import ua.shop.dao.ProductRepository;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private BrandRepository brandRepository;

    @Transactional
    public void addProduct(Product product) {
        productRepository.save(product);
    }

    @Transactional
    public void saveProduct(Product product) {
        productRepository.save(product);
    }

    @Transactional
    public void addBrand(Brand brand) {
        brandRepository.save(brand);
    }

    @Transactional
    public void deleteProducts(long[] idList) {
        for (long id : idList)
            productRepository.deleteById(id);
    }

    @Transactional()
    public List<Brand> findBrands() {
        return brandRepository.findAll();
    }

    @Transactional
    public Product findProductById(long id){
        return productRepository.findProductById(id);
    }

    @Transactional(readOnly=true)
    public List<Product> findAll(Pageable pageable) {
        return productRepository.findAll(pageable).getContent();
    }

    @Transactional(readOnly = true)
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Transactional(readOnly=true)
    public List<Product> findByBrand(Brand brand, Pageable pageable) {
        return productRepository.findByBrand(brand, pageable);
    }

    @Transactional(readOnly = true)
    public long countByBrand(Brand brand) {
        return productRepository.countByBrand(brand);
    }

    @Transactional(readOnly = true)
    public List<Product> findByPattern(String pattern, Pageable pageable) {
        return productRepository.findByPattern(pattern, pageable);
    }

    @Transactional(readOnly = true)
    public long count() {
        return productRepository.count();
    }

    @Transactional(readOnly = true)
    public Brand findBrand(long id) {
        return brandRepository.getOne(id);
    }
}