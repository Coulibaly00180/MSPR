package com.mspr.back.controllers;

import com.mspr.back.entities.User;
import com.mspr.back.services.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/users")
@RestController
public class UserController {


   @MessageMapping("/utilisateur.addUtilisateur")
   @SendTo("/utilisateur/topic")
   public User addUtilisateur( @Payload User user){
      userService.saveUtilisateur(user);
      return user;
   }

   @MessageMapping("/utilisateur.deconnectUtilisateur")
   @SendTo("/utilisateur/topic")
   public User deconnect ( @Payload User utilisateur){
      userService.deconnect(utilisateur);
      return utilisateur;
   }

   @GetMapping("/utilisateurs")
   public ResponseEntity<List<User>> findConnectUtilisateurs(){
      return ResponseEntity.ok(userService.findUtilisateursConnectes());
   }

   @GetMapping
   public Iterable<User> getAllUtilisateurs() {
      return userService.getAllUtilisateurs();
   }

   @GetMapping("/{id}")
   public User getUtilisateurById(@PathVariable Long id) {
      return userService.getUtilisateurById(id);
   }

   @PostMapping
   public User saveUtilisateur(@RequestBody User utilisateur) {
      return userService.saveUtilisateur(utilisateur);
   }

   @PutMapping("/{id}")
   public User updateUtilisateur(@PathVariable Long id, @RequestBody User userDetails) {
      User user = userService.getUtilisateurById(id);
      if (user != null) {
         user.setNom(userDetails.getNom());
         user.setPrenom(userDetails.getPrenom());
         user.setEmail(userDetails.getEmail());
         user.setPassword(userDetails.getPassword());
         return userService.saveUtilisateur(user);
      }
      return null;
   }

   @DeleteMapping("/{id}")
   public void deleteUtilisateur(@PathVariable Long id) {
      userService.deleteUtilisateur(id);
   }

   private final UserService userService;

   public UserController(UserService userService) {
      this.userService = userService;
   }

   @GetMapping("/test")
   public ResponseEntity<User> authenticatedUser() {
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

      User currentUser = (User) authentication.getPrincipal();

      return ResponseEntity.ok(currentUser);
   }

   @GetMapping("/")
   public ResponseEntity<List<User>> allUsers() {
      List <User> users = userService.allUsers();
      return ResponseEntity.ok(users);
   }
}
