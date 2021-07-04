package ua.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.shop.dao.CustomUser;
import ua.shop.dao.impl.UserRepository;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Transactional(readOnly = true)
    public CustomUser getUserByLogin(String login) {
        return userRepository.findByLogin(login);
    }

    @Transactional
    public List<CustomUser> findUsersById(long id) {
        return userRepository.findCustomUsersById(id);
    }

    @Transactional(readOnly = true)
    public boolean existsByLogin(String login) {
        return userRepository.existsByLogin(login);
    }

    @Transactional
    public void addUser(CustomUser customUser) {
        userRepository.save(customUser);
    }

    @Transactional
    public void save(CustomUser customUser) {
        userRepository.save(customUser);
    }

    @Transactional
    public void updateUser(CustomUser customUser) {
        userRepository.save(customUser);
    }

    @Transactional
    public List<CustomUser> findAllCustomUser() {
        return userRepository.findAll();
    }

    @Transactional(readOnly = true)
    public List<CustomUser> findAllCustomUsersPage(Pageable pageable) {
        return userRepository.findAll(pageable).getContent();
    }

    @Transactional
    public void deleteUser(long[] toDelete) {
        for (long id : toDelete)
            userRepository.deleteById(id);
    }

    @Transactional
    public long count() {
        return userRepository.count();
    }
}