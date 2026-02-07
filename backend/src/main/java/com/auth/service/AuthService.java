package com.auth.service;

import com.auth.dto.LoginRequest;
import com.auth.dto.LoginResponse;
import com.auth.dto.RegisterRequest;
import com.auth.dto.UserDTO;
import com.auth.entity.User;
import com.auth.repository.UserRepository;
import com.auth.security.JwtTokenProvider;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthService {
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final JwtTokenProvider tokenProvider;

    public AuthService(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder, JwtTokenProvider tokenProvider) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.tokenProvider = tokenProvider;
    }

    public UserDTO register(RegisterRequest req) {
        if (userRepository.findByUsername(req.getUsername()).isPresent()) {
            throw new RuntimeException("Username already taken");
        }
        User u = new User(req.getUsername(), passwordEncoder.encode(req.getPassword()), req.getEmail());
        User saved = userRepository.save(u);
        return new UserDTO(saved.getId(), saved.getUsername(), saved.getEmail());
    }

    public LoginResponse login(LoginRequest req) {
        Optional<User> opt = userRepository.findByUsername(req.getUsername());
        if (opt.isEmpty()) throw new RuntimeException("Invalid credentials");
        User u = opt.get();
        if (!passwordEncoder.matches(req.getPassword(), u.getPassword())) throw new RuntimeException("Invalid credentials");
        String token = tokenProvider.createToken(u.getUsername());
        return new LoginResponse(token);
    }

    public Optional<UserDTO> findByUsername(String username) {
        return userRepository.findByUsername(username).map(u -> new UserDTO(u.getId(), u.getUsername(), u.getEmail()));
    }
}
