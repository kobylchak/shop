package ua.shop.dao.impl;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.shop.dao.Photo;

public interface PhotoRepository extends JpaRepository<Photo, Long> {
}
