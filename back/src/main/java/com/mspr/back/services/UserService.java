package com.mspr.back.services;

import com.mspr.back.entities.Statut;
import com.mspr.back.entities.User;
import com.mspr.back.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {
   private final UserRepository userRepository;

   public UserService(UserRepository userRepository) {
      this.userRepository = userRepository;
   }

   public List<User> allUsers() {
      List<User> users = new ArrayList<>();
      userRepository.findAll().forEach(users::add);
      return users;
   }

   public User getUtilisateurConnecte(HttpSession session) {
      return (User) session.getAttribute("utilisateurConnecte");
   }

   public User getUtilisateurById(final Long id) {
      return userRepository.findById(id).orElse(null);
   }

   public Iterable<User> getAllUtilisateurs() {
      return userRepository.findAll();
   }


   public void deleteUtilisateur(final Long id) {
      userRepository.deleteById(id);
   }

   public User saveUtilisateur(User utilisateur) {
      utilisateur.setStatut(Statut.ONLINE);
      return userRepository.save(utilisateur);
   }

   public void deconnect(User utilisateur){
      var user = userRepository.findById(utilisateur.getId())
            .orElse(null);
      if (user != null){
         user.setStatut(Statut.OFFLINE);
         userRepository.save(user);
      }
   }

   public List<User> findUtilisateursConnectes() {
      return userRepository.findAllByStatut(Statut.ONLINE);
   }

}
