package com.mspr.back.services;

import com.mspr.back.entities.Statut;
import com.mspr.back.entities.Utilisateur;
import com.mspr.back.repositories.UtilisateurRepository;
import jakarta.servlet.http.HttpSession;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Data
@Service
@RequiredArgsConstructor
public class UtilisateurService {

    public Utilisateur getUtilisateurConnecte(HttpSession session) {
        return (Utilisateur) session.getAttribute("utilisateurConnecte");
    }

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    public Utilisateur getUtilisateurById(final Long id) {
        return utilisateurRepository.findById(id).orElse(null);
    }

    public Iterable<Utilisateur> getAllUtilisateurs() {
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
