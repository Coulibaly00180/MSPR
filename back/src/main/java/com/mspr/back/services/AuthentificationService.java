package com.mspr.back.services;

import com.mspr.back.entities.Utilisateur;
import com.mspr.back.repositories.UtilisateurRepository;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Data
@Slf4j
public class AuthentificationService {

    private final UtilisateurRepository utilisateurRepository;
    //private final BCryptPasswordEncoder passwordEncoder; // mot de passe hasher

    @Autowired
    public AuthentificationService(UtilisateurRepository utilisateurRepository){
        this.utilisateurRepository = utilisateurRepository;
    }

    // Verifie la connexion
    public boolean connecteUtilisateur(String email, String password){
        Utilisateur utilisateur = utilisateurRepository.findByEmail(email);
        return utilisateur != null && password.equals(utilisateur.getPassword());
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
    public boolean inscriptionUtilisateur(Utilisateur utilisateur) {


        if(utilisateurRepository.findByEmail(utilisateur.getEmail())!=null){
            return false;
        }
        utilisateurRepository.save(utilisateur);
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
}
