//package ua.shop.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.MailException;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Service;
//import ua.shop.dao.CustomUser;
//
//@Service
//public class NotificationService {
//
//    private JavaMailSender javaMailSender;
//
//    @Autowired
//    public NotificationService(JavaMailSender javaMailSender){
//        this.javaMailSender = javaMailSender;
//    }
//
//    public void sendNotification(CustomUser user)throws MailException {
//        SimpleMailMessage mail = new SimpleMailMessage();
//        mail.setTo("vasylkobylchak@gmail.com");
//        mail.setFrom("beonconnection@gmail.com");
//        StringBuilder result = new StringBuilder();
//        result.append("na obrabotky").append(System.lineSeparator()).append("user name + ").append(System.lineSeparator()).append("bye");
//        mail.setSubject("na obrabotky");
//        mail.setText(result.toString());
//        javaMailSender.send(mail);
//    }
//
//}
