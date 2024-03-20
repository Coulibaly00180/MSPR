package com.mspr.back.repositories;

import com.mspr.back.entities.Annonce;
import com.mspr.back.entities.Plante;
import com.mspr.back.entities.Utilisateur;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "records", path = "plantes")
public interface PlanteRepository extends CrudRepository<Plante, Long> {

    /*
    List<Catalogue> findAllBy(String categorie);

    Optional<Catalogue> findById(Long id);

     */

    Plante findByAnnoncesAndUtilisateur(Annonce annonce, Utilisateur utilisateur);

}
