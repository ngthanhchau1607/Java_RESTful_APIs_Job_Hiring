package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.example.demo.controller.AuthController;
import com.example.demo.domain.Company;
import com.example.demo.domain.User;
import com.example.demo.domain.dto.RestUser;
import com.example.demo.repository.UserRepository;

@Service
public class UserService {

    private final AuthController authController;
    private final UserRepository userRepository;
    private final CompanyService companyService;

    public UserService(UserRepository userRepository, AuthController authController, CompanyService companyService) {
        this.userRepository = userRepository;
        this.authController = authController;
        this.companyService = companyService;

    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public List<User> getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User handleUserByEmail(String email) {
        return this.userRepository.findUserByEmail(email);
    }

    public User handleGetUserByName(String name) {
        return this.userRepository.findUserByName(name);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public boolean isEmailExist(String email) {
        return this.userRepository.existByEmail(email);
    }

    public User handleSaveUser(User user) {
        if (user.getCompany() != null) {
            Optional<Company> companyOptional = this.companyService.findCompanyById(user.getCompany().getId());
            user.setCompany(companyOptional.isPresent() ? companyOptional.get() : null);
        }
        return this.userRepository.save(user);
    }

    public User handleUpdateUser(User userRq) {
        User currentUser = this.getUserById(userRq.getId());
        if (currentUser != null) {
            currentUser.setEmail(userRq.getEmail());
            currentUser.setName(userRq.getName());
            currentUser.setPassword(userRq.getPassword());
            currentUser = this.userRepository.save(currentUser);
        }
        return currentUser;
    }

    public void handleDeleteUser(long id) {
        this.userRepository.deleteById(id);
    }

    public RestUser convertToResCreateUserDTO(User user) {
        RestUser res = new RestUser();
        res.setId(user.getId());
        res.setEmail(user.getEmail());
        res.setName(user.getName());
        res.setAge(user.getAge());
        res.setAddress(user.getAddress());
        res.setGender(user.getGender());
        return res;
    }
}
