package com.mspr.back.services;

import com.mspr.back.entities.Utilisateur;
import com.mspr.back.repositories.UtilisateurRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

//@Service
//@Data
public class AuthentificationService {

    /*
    private final UtilisateurRepository utilisateurRepository;
    private final BCryptPasswordEncoder passwordEncoder; // mot de passe hasher

    @Autowired
    public AuthentificationService(UtilisateurRepository utilisateurRepository, BCryptPasswordEncoder passwordEncoder){
        this.utilisateurRepository = utilisateurRepository;
        this.passwordEncoder = passwordEncoder ;
    }

    // Verifie la connexion
    public boolean authentificationUtilisateur(String email, String password){
        Utilisateur utilisateur = utilisateurRepository.findByEmail(email);
        return utilisateur != null && passwordEncoder.matches(password, utilisateur.getPassword());
    }

    // Verifie si l'utilisateur est inscrit
    // Sinon le creer
    public boolean utilisateurEstInscrit(String email, String password) {
        // Si l'utilisateur existe déjà
        if (utilisateurRepository.findByEmail(email) != null){
            return false;
        }

        Utilisateur newUtilisateur = new Utilisateur();
        newUtilisateur.setEmail(email);
        newUtilisateur.setPassword(passwordEncoder.encode(password)); // Hash le mot de passe

        utilisateurRepository.save(newUtilisateur);
        return true;
    }

     */
}
