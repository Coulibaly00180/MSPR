package com.mspr.back.services;

import com.mspr.back.custom_exception.EntityAlreadyExistsException;
import com.mspr.back.entities.Botaniste;
import com.mspr.back.entities.Utilisateur;
import com.mspr.back.repositories.UtilisateurRepository;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@AllArgsConstructor
@Service
public class UtilisateurService {

    private UtilisateurRepository utilisateurRepository;
    private BCryptPasswordEncoder passwordEncoder;

    public Optional<Utilisateur> getUtilisateur(final Long id) {
        return utilisateurRepository.findById(id);
    }

    public Iterable<Utilisateur> getUtilisateurs() {
        return utilisateurRepository.findAll();
    }

    public void deleteUtilisateur(final Long id) {
        utilisateurRepository.deleteById(id);
    }

    public Utilisateur saveUtilisateur(Utilisateur utilisateur) throws EntityAlreadyExistsException {
        String encodedMdp = this.passwordEncoder.encode(utilisateur.getPassword());
        utilisateur.setPassword(encodedMdp);
        // On peut vérifier que le mail de l'utilisateur est valide (à implémenter à l'avenir par une regex)
        if(this.utilisateurRepository.findByEmail(utilisateur.getEmail()).isPresent()) {
            throw new EntityAlreadyExistsException("Cet utilisateur existe déjà");
        } else {
            return utilisateurRepository.save(utilisateur);
        }
    }
}
