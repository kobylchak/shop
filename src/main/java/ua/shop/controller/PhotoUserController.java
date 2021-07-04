package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.shop.dao.Photo;
import ua.shop.exception.PhotoNotFoundException;
import ua.shop.service.PhotoService;

@Controller
@RequestMapping("/photo")
public class PhotoUserController {
    @Autowired
    private PhotoService photoService;

    @GetMapping("/{photo.id}")
    public ResponseEntity<byte[]> onPhoto(@PathVariable("photo.id") long id) {
        return photoById(id);
    }

    private ResponseEntity<byte[]> photoById(long id) {
        Photo photo = photoService.findPhotoById(id);
        byte[] bytes = photo.getPhoto();
        if (bytes == null)
            throw new PhotoNotFoundException();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
    }
}

