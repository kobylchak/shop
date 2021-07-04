//package ua.shop.controller;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.MailException;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import ua.shop.dao.CustomUser;
//import ua.shop.service.NotificationService;
//
//@RestController
//public class RegistrationController {
//    private Logger logger = LoggerFactory.getLogger(RegistrationController.class);
//    @Autowired
//    private NotificationService notificationService;
//
//    @RequestMapping("/report")
//    public String signupSuccess() {
//        CustomUser shop = new CustomUser();
//        shop.setEmail("beonconnection@gmail.com");
//        try {
//            notificationService.sendNotification(shop);
//        } catch (MailException e) {
//            logger.info("Error Sending Email: " + e.getMessage());
//        }
//        return "Thank you for registering with us.";
//    }
//}
