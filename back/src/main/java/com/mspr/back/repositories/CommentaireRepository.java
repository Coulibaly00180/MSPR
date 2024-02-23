package com.mspr.back.repositories;

import com.mspr.back.entities.Commentaire;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "records", path = "commentaires")
public interface CommentaireRepository extends CrudRepository<Commentaire,Long> {

}
