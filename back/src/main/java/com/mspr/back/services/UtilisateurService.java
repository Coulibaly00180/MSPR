package com.mspr.back.services;

import com.mspr.back.custom_exception.EntityAlreadyExistsException;
import com.mspr.back.entities.Utilisateur;
import com.mspr.back.repositories.UtilisateurRepository;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Slf4j
@Service
public class UtilisateurService {

    private UtilisateurRepository utilisateurRepository;
    private BCryptPasswordEncoder passwordEncoder;

    /**
     *
     * @param id
     * @return
     */
    public Optional<Utilisateur> getUtilisateur(final Long id) {
        return utilisateurRepository.findById(id);
    }

    /**
     *
     * @return
     */
    public Iterable<Utilisateur> getUtilisateurs() {
        return utilisateurRepository.findAll();
    }

    /**
     *
     * @param id
     */
    public void deleteUtilisateur(final Long id) {
        utilisateurRepository.deleteById(id);
    }

    /**
     *
     * @param email
     * @param password
     */
    public void login(String email, String password) {
        Optional<Utilisateur> user = this.utilisateurRepository.findByEmail(email);
        if(user.isPresent()) {
            boolean userExists = user.get().getPassword().equals(this.passwordEncoder.encode(password));
            if(userExists){
                log.info(user + "Connecté");
            } else {
                log.info("Cet utilisateur n'existe pas");
            }
        }
    }

    /**
     *
     * @param utilisateur
     * @return
     * @throws EntityAlreadyExistsException
     */
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
}
