package com.mspr.back.services;

import com.mspr.back.entities.Botaniste;
import com.mspr.back.entities.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class UtilisateurService {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    public Optional<Utilisateur> getUtilisateur(final Long id) {
        return utilisateurRepository.findById(id);
    }

    public Iterable<Utilisateur> getUtilisateur() {
        return utilisateurRepository.findAll();
    }

    public void deleteUtilisateur(final Long id) {
        utilisateurRepository.deleteById(id);
    }

    public Utilisateur saveUtilisateur(Utilisateur utilisateur) {
        Utilisateur savedUtilisateur = utilisateurRepository.save(utilisateur);
        return savedUtilisateur;
    }
}
