package com.auth.controller;

import com.auth.dto.UserDTO;
import com.auth.service.AuthService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user")
public class UserController {
    private final AuthService authService;

    public UserController(AuthService authService) { this.authService = authService; }

    @GetMapping("/me")
    public ResponseEntity<UserDTO> me(Authentication authentication) {
        String username = authentication.getName();
        return authService.findByUsername(username)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }
}
