package com.mspr.back.repositories;

import com.mspr.back.entities.Statut;
import com.mspr.back.entities.Utilisateur;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "records", path = "utilisateurs")
public interface UtilisateurRepository extends CrudRepository <Utilisateur, Long> {
    Utilisateur findByEmailAndPassword(String email, String password);
    //Utiliser un optional pour bonne pratique
    Utilisateur findByEmail(String email);

    //Utiliser un optional pour bonne pratique
    Utilisateur findUtilisateurById(Long id);

    List<Utilisateur> findAllByStatut(Statut statut);
}
