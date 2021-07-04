package ua.shop;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import ua.shop.dao.Basket;
import ua.shop.dao.CustomUser;
import ua.shop.dao.UserRole;
import ua.shop.service.MobileService;
import ua.shop.service.UserService;

import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
public class ShopApplication {
    public static void main(String[] args) {
        SpringApplication.run(ShopApplication.class, args);
    }

    @Bean
    public CommandLineRunner demo(final MobileService mobileService, final UserService userService) {
        return new CommandLineRunner() {
            @Override
            public void run(String... strings) throws Exception {
                List<Basket> list = new ArrayList<>();
                userService.addUser(new CustomUser("admin", "$2a$08$.JUplF24HwIZW7XPgo.94uRQHYse2HGYNq4z.5nQllco7O.EyHSu.", UserRole.ADMIN, "admin@gmailcom", list));
            }
        };
    }
}
