package com.mspr.back.repositories;

import com.mspr.back.entities.Botaniste;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "records", path = "botanistes")
public interface BotanisteRepository extends CrudRepository<Botaniste, Long> {

}
