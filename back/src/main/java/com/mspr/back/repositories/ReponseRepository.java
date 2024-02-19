package com.mspr.back.repositories;

import com.mspr.back.entities.Reponse;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "records", path = "reponses")
public interface ReponseRepository extends CrudRepository<Reponse,Long> {
}
