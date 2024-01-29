package com.mspr.back.repositories;

import com.mspr.back.entities.Catalogue;
import org.springframework.data.repository.CrudRepository;

public interface CatalogueRepository extends CrudRepository<Catalogue, Long> {
}
