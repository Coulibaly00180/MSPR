package com.mspr.back.controllers;

import com.mspr.back.dto.LoginUserDto;
import com.mspr.back.dto.RegisterUserDto;
import com.mspr.back.entities.User;
import com.mspr.back.services.AuthenticationService;
import com.mspr.back.services.JwtService;
import com.mspr.back.services.LoginResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequestMapping("/auth")
@RestController
public class AuthenticationController {
   private final JwtService jwtService;

   private final AuthenticationService authenticationService;

   public AuthenticationController(JwtService jwtService, AuthenticationService authenticationService) {
      this.jwtService = jwtService;
      this.authenticationService = authenticationService;
   }

   @PostMapping("/signup")
   public ResponseEntity<User> register(@RequestBody RegisterUserDto registerUserDto) {
      User registeredUser = authenticationService.signup(registerUserDto);

      return ResponseEntity.ok(registeredUser);
   }

   @PostMapping("/login")
   public ResponseEntity<LoginResponse> authenticate(@RequestBody LoginUserDto loginUserDto) {

      User authenticatedUser = authenticationService.authenticate(loginUserDto);

      log.info("bearer=>" + authenticatedUser);

      String jwtToken = jwtService.generateToken(authenticatedUser);

      LoginResponse loginResponse = new LoginResponse(jwtToken,jwtService.getJwtExpiration());

      return ResponseEntity.ok(loginResponse);
   }


   /*@PostMapping("/login")
   public ResponseEntity<?> authenticate(@RequestBody LoginUserDto loginUserDto) {
      try {
         User authenticatedUser = authenticationService.authenticate(loginUserDto);

         if (authenticatedUser != null) {
            String jwtToken = jwtService.generateToken(authenticatedUser);
            LoginResponse loginResponse = new LoginResponse(jwtToken, jwtService.getJwtExpiration());
            return ResponseEntity.ok(loginResponse);
         } else {
            // L'authentification a échoué, renvoyer une réponse appropriée
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Authentification échouée. Veuillez vérifier vos informations d'identification.");
         }
      } catch (Exception e) {
         // Logguer l'erreur pour un débogage ultérieur
         log.error("Une erreur s'est produite lors de l'authentification: " + e.getMessage());
         // Renvoyer une réponse d'erreur générique
         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Une erreur s'est produite lors de l'authentification.");
      }
   }
    */

   @PostMapping("/testurl")
   public String toto(@RequestBody LoginUserDto loginUserDto){
      return "ok";
   }

}