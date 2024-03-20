package com.mspr.back.repositories;

import com.mspr.back.entities.Annonce;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.time.LocalDate;
import java.util.List;

@RepositoryRestResource(collectionResourceRel = "records", path = "annonces")
public interface AnnonceRepository extends CrudRepository<Annonce, Long> {

    // Annonce en cours
    List<Annonce> findByDateFin(LocalDate date);

    List<Annonce> findByDateDebutAndDateFin(LocalDate dateDebut, LocalDate dateFin);

    @Query("SELECT a FROM Annonce a LEFT JOIN FETCH a.plantes_annonce WHERE a.id = :annonceId")
    Annonce findAnnonceDetails(@Param("annonceId") Long annonceId);


    @Query("SELECT DISTINCT a FROM Annonce a " +
            "JOIN a.plantes_annonce p " +
            "JOIN p.utilisateur u " +
            "WHERE u.id = :utilisateurId")
    List<Annonce> findAnnoncesByUtilisateurId(@Param("utilisateurId") Long utilisateurId);


    @Query("SELECT DISTINCT a FROM Annonce a " +
            "JOIN a.plantes_annonce p " +
            "JOIN p.utilisateur u " +
            "WHERE a.dateDebut <= CURRENT_DATE" +
            " AND a.dateFin >= CURRENT_DATE" +
            " AND p.utilisateur.adresse = :adresseUtilisateur")
    List<Annonce> findAnnoncesEnCoursByAdresseUtilisateur(@Param("adresseUtilisateur") String adresseUtilisateur);

    List<Annonce> findByDateFinAfter(LocalDate dateFin);
    List<Annonce> findByDateFinBefore(LocalDate dateFin);

    List<Annonce> findByDateDebutBeforeAndDateFinAfter(LocalDate dateDebut, LocalDate dateFin);



}
