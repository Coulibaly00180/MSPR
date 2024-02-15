package com.mspr.back.repositories;

import com.mspr.back.entities.Entretien;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "records", path = "entretiens")
public interface EntretienRepository extends CrudRepository<Entretien,Long> {
}
