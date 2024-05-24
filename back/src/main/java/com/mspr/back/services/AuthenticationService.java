package com.mspr.back.services;

import com.mspr.back.dto.LoginUserDto;
import com.mspr.back.dto.RegisterUserDto;
import com.mspr.back.entities.User;
import com.mspr.back.repositories.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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

   /*public AuthenticationService(
         UserRepository userRepository,
         AuthenticationManager authenticationManager,
         PasswordEncoder passwordEncoder
   ) {
      this.authenticationManager = authenticationManager;
      this.userRepository = userRepository;
      this.passwordEncoder = passwordEncoder;
   }

    */

   //private final BCryptPasswordEncoder passwordEncoder; // mot de passe hasher

   @Autowired
   public AuthenticationService(UserRepository userRepository, PasswordEncoder passwordEncoder, AuthenticationManager authenticationManager){
      this.userRepository = userRepository;
      this.passwordEncoder = passwordEncoder;
      this.authenticationManager = authenticationManager;
   }

   // Verifie la connexion
   public boolean connecteUtilisateur(String email, String password){
      User user = userRepository.findByEmail(email);
      return user != null && password.equals(user.getPassword());
      //return emailUser != null && passwordEncoder.matches(password, utilisateur.getPassword());
   }

    /*
    public Utilisateur register(Utilisateur utilisateur) throws EntityAlreadyExistsException {
        String encodedMdp = this.passwordEncoder.encode(utilisateur.getPassword());
        utilisateur.setPassword(encodedMdp);
        // On peut vérifier que le mail de l'utilisateur est valide (à implémenter à l'avenir par une regex)
        if(this.utilisateurRepository.findByEmail(utilisateur.getEmail()).isPresent())
            throw new EntityAlreadyExistsException("Cet utilisateur existe déjà");
        else {
            log.info("enregistré !");
            return utilisateurRepository.save(utilisateur);
        }
    }

     */

   // Verifie si l'utilisateur est inscrit
   // Sinon le creer
   public boolean inscriptionUtilisateur(User user) {

      if(userRepository.findByEmail(user.getEmail())!=null){
         return false;
      }
      userRepository.save(user);
      return true;

      // String passwordEncode = passwordEncoder.encode(utilisateur.getPassword());
      // utilisateur.setPassword(passwordEncode);       // Si l'utilisateur existe déjà

      //if (utilisateurRepository.findByEmail(email) != null){
      //return false;
      //}

      //Utilisateur newUtilisateur = new Utilisateur();
      //newUtilisateur.setEmail(email);
      //newUtilisateur.setPassword(passwordEncoder.encode(password)); // Hash le mot de passe

      //log.info(" =============== " +passwordEncode);
   }

   public User signup(RegisterUserDto input) {
      User user = new User(input.getNom(), input.getPrenom(), input.getAdresse(), input.getEmail(), passwordEncoder.encode(input.getPassword()));
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
