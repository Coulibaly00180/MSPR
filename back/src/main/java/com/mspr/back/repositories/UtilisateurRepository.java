package com.mspr.back.repositories;

import com.mspr.back.entities.Utilisateur;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "records", path = "utilisateurs")
public interface UtilisateurRepository extends CrudRepository <Utilisateur, Long> {

    //Utilisateur findByEmailAndPassword(String email, String password);

    Utilisateur findByEmailAndPassword(String email, String password);

    Utilisateur findByEmail(String email);

    Optional<Utilisateur> findByEmail(String email);
}
