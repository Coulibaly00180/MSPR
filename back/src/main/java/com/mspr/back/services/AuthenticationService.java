package com.mspr.back.services;

import com.mspr.back.dto.LoginUserDto;
import com.mspr.back.dto.RegisterUserDto;
import com.mspr.back.entities.User;
import com.mspr.back.repositories.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class AuthenticationService {
   private final UserRepository userRepository;

   private final PasswordEncoder passwordEncoder;

   private final AuthenticationManager authenticationManager;

   public AuthenticationService(
         UserRepository userRepository,
         AuthenticationManager authenticationManager,
         PasswordEncoder passwordEncoder
   ) {
      this.authenticationManager = authenticationManager;
      this.userRepository = userRepository;
      this.passwordEncoder = passwordEncoder;
   }

   public User signup(RegisterUserDto input) {
      User user = new User(input.getFullName(), input.getEmail(), passwordEncoder.encode(input.getPassword()));
      return userRepository.save(user);
   }

   public User authenticate(LoginUserDto input) {
      authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(
                  input.getEmail(),
                  input.getPassword()
            )
      );

      return userRepository.findByEmail(input.getEmail());
   }
}
