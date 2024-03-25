package com.mspr.back.services;

import com.mspr.back.entities.Statut;
import com.mspr.back.entities.Utilisateur;
import com.mspr.back.repositories.UtilisateurRepository;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Data
@Service
@RequiredArgsConstructor
public class UtilisateurService {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    public Optional<Utilisateur> getUtilisateur(final Long id) {
        return utilisateurRepository.findById(id);
    }

    public Iterable<Utilisateur> getUtilisateurs() {
        return utilisateurRepository.findAll();
    }


    public void deleteUtilisateur(final Long id) {
        utilisateurRepository.deleteById(id);
    }

    public Utilisateur saveUtilisateur(Utilisateur utilisateur) {
        utilisateur.setStatut(Statut.ONLINE);
        return utilisateurRepository.save(utilisateur);
    }

    public void deconnect(Utilisateur utilisateur){
        var user = utilisateurRepository.findById(utilisateur.getId())
                .orElse(null);
        if (user != null){
            user.setStatut(Statut.OFFLINE);
            utilisateurRepository.save(user);
        }
    }


    public List<Utilisateur> findUtilisateursConnectes() {
        return utilisateurRepository.findAllByStatut(Statut.ONLINE);
    }



}
