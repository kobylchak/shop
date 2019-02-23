package ua.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.shop.dao.Mobile;
import ua.shop.dao.Photo;
import ua.shop.exception.PhotoErrorException;
import ua.shop.service.MobileService;
import ua.shop.service.PhotoService;

import java.io.IOException;

@Controller
@RequestMapping("/photo")
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class PhotoController {
    @Autowired
    private MobileService mobileService;

    @Autowired
    private PhotoService photoService;

    @GetMapping("/download/{mobile.id}")
    public String downloadPhoto(@PathVariable("mobile.id") long id,
                                Model model) {
        model.addAttribute("mobileId", id);
        return "photo_add_page";
    }

    @PostMapping("/add")
    public String photoAdd(Model model,
                           @RequestParam(value = "mobileId") long mobileId,
                           @RequestParam MultipartFile photo) {
        try {
            Mobile mobile = mobileService.findMobileById(mobileId);
            mobile.getPhotos().add(new Photo(mobile, photo.getBytes()));
            mobileService.saveMobile(mobile);
            return "redirect:/admin";
        } catch (IOException ex) {
            throw new PhotoErrorException();
        }
    }

    @PostMapping("/delete")
    public ResponseEntity<Void> deletePhoto(@RequestParam(value = "toDeletePhoto[]", required = false) long[] toDelete) {
        if (toDelete != null && toDelete.length > 0)
            photoService.deletePhotos(toDelete);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
