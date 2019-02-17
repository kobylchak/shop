package ua.shop.service;

import ua.shop.dao.CustomUser;

import java.util.List;

public interface UserService {
    CustomUser getUserByLogin(String login);

    boolean existsByLogin(String login);

    void addUser(CustomUser customUser);

    void updateUser(CustomUser customUser);

    List<CustomUser> findAllCustomUser();

    void deleteUser(long[] toDelete);
}