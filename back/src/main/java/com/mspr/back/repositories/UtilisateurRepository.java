package com.mspr.back.repositories;

import com.mspr.back.entities.Statut;
import com.mspr.back.entities.Utilisateur;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;
import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "records", path = "utilisateurs")
public interface UtilisateurRepository extends CrudRepository <Utilisateur, Long> {
    Utilisateur findByEmailAndPassword(String email, String password);

    Utilisateur findByEmail(String email);

    List<Utilisateur> findAllByStatut(Statut statut);

}
