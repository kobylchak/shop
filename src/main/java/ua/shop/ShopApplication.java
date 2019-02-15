package ua.shop;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import ua.shop.dao.CustomUser;
import ua.shop.dao.UserRole;
import ua.shop.service.ProductService;
import ua.shop.service.UserService;

@SpringBootApplication
public class ShopApplication {

    public static void main(String[] args) {

        SpringApplication.run(ShopApplication.class, args);
    }


    @Bean
    public CommandLineRunner demo(final ProductService productService, final UserService userService) {
        return new CommandLineRunner() {
            @Override
            public void run(String... strings) throws Exception {
                userService.addUser(new CustomUser("admin", "$2a$10$QTLi3Raw8MPC1XTk83d63.n8STr3p.hgqGwhD1yWjmzTU0XmRuj36", UserRole.ADMIN));
                userService.addUser(new CustomUser("user", "$2a$10$s0nvPz6NO8oOvIvFYljjJekQ3BkXgDy2NZsjOawQH8Gj1cNfLp9SO", UserRole.USER));
                userService.addUser(new CustomUser("aa", "a", UserRole.USER));
            }
        };
    }
}
