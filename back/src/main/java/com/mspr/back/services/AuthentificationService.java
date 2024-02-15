package com.mspr.back.services;

import com.mspr.back.entities.Utilisateur;
import com.mspr.back.repositories.UtilisateurRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Data
public class AuthentificationService {

    private final UtilisateurRepository utilisateurRepository;

    @Autowired
    public AuthentificationService(UtilisateurRepository utilisateurRepository){
        this.utilisateurRepository = utilisateurRepository;
    }

    public boolean authentificationUtilisateur(String email, String password){
        Utilisateur utilisateur = utilisateurRepository.findByEmailAndPassword(email,password);
        return utilisateur != null;
    }


}
