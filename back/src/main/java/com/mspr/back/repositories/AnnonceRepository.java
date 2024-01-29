package com.mspr.back.repositories;

import com.mspr.back.entities.Annonce;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.time.LocalDate;
import java.util.List;

@RepositoryRestResource(collectionResourceRel = "records", path = "annonces")
public interface AnnonceRepository extends CrudRepository<Annonce, Long> {

    List<Annonce> findByDateDebut(LocalDate date);

    List<Annonce> getAnnonceByDateDebut(LocalDate date);

    <Optional>Annonce findById(Long id);

    //Annonce save(Annonce annonce);


}
