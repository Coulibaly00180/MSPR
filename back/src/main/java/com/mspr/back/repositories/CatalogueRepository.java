package com.mspr.back.repositories;

import com.mspr.back.entities.Catalogue;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;
import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "records", path = "catalogues")
public interface CatalogueRepository extends CrudRepository<Catalogue, Long> {

    /*
    List<Catalogue> findAllBy(String categorie);

    Optional<Catalogue> findById(Long id);

     */

}
