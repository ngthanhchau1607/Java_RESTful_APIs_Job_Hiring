package com.example.demo.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.domain.User;
import com.example.demo.service.UserService;
import com.example.demo.util.annotation.ApiMessage;
import com.example.demo.util.error.IdInvalidException;

@RestController
// @RequestMapping("/api/v1")
public class UserController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("user/{id}")
    public User getUserById(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        return user;
    }

    @GetMapping("user")
    public List<User> getAllUser(Model model) {
        List<User> user = this.userService.getAllUser();
        return user;
    }

    @DeleteMapping("user/{id}")
    @ApiMessage("Delete a user")
    public ResponseEntity<String> deleteUserById(Model model, @PathVariable long id) throws IdInvalidException {
        if (id > 1500) {
            throw new IdInvalidException("id qua lon");
        }
        this.userService.handleDeleteUser(id);
        return ResponseEntity.ok(null);
    }

    @PostMapping("user/create")
    @ApiMessage("Create new user")
    public ResponseEntity<User> createNewUser(
            @RequestBody User postManUser) throws IdInvalidException {
        boolean isEmailEist = this.userService.isEmailExist(postManUser.getEmail());
        if (isEmailEist) {
            throw new IdInvalidException(
                    "Email" + postManUser.getEmail() + "đã tồn tại , vui lòng sử dụng email khác");
        }
        String hassPass = this.passwordEncoder.encode(postManUser.getPassword());
        postManUser.setPassword(hassPass);
        this.userService.handleSaveUser(postManUser);
        return ResponseEntity.status(HttpStatus.CREATED).body(postManUser);
    }

    @PutMapping("user")
    public User updateUser(
            @RequestBody User postManUser) {
        this.userService.handleUpdateUser(postManUser);
        return postManUser;
    }

}
