package com.mspr.back.repositories;

import com.mspr.back.entities.Annonce;
import com.mspr.back.entities.Entretien;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.transaction.annotation.Transactional;

@RepositoryRestResource(collectionResourceRel = "records", path = "entretiens")
public interface EntretienRepository extends CrudRepository<Entretien,Long> {


}
