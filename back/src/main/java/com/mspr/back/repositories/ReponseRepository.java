package com.mspr.back.repositories;

import com.mspr.back.entities.Reponse;
import com.mspr.back.entities.ReponseKey;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "records", path = "reponses")
public interface ReponseRepository extends CrudRepository<Reponse,ReponseKey> {
    Optional<Reponse> findById(ReponseKey reponseKey);
}
