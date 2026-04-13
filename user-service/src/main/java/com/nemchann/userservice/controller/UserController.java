package com.nemchann.userservice.controller;


import com.nemchann.userservice.entity.User;
import com.nemchann.userservice.repository.UserRepository;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping("/register")
    public ResponseEntity<User> registerUser(@Valid @RequestBody User user) {
        // Здесь в будущем добавишь PasswordEncoder из Spring Security
        User savedUser = userRepository.save(user);
        return ResponseEntity.ok(savedUser);
    }
}
