package com.mspr.back.services;

import com.mspr.back.entities.Annonce;
import com.mspr.back.entities.Plante;
import com.mspr.back.repositories.AnnonceRepository;
import com.mspr.back.repositories.PlanteRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Data
@Service
@Transactional
public class AnnonceService {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private AnnonceRepository annonceRepository;

    @Autowired
    private PlanteRepository planteRepository;

    public Optional<Annonce> getAnnonce(final Long id) {
        return annonceRepository.findById(id);
    }

    public Iterable<Annonce> getAnnonces() {
        return annonceRepository.findAll();
    }

    public void deleteAnnonce(final Long id) {
        annonceRepository.deleteById(id);
    }

    public Annonce addAnnonce(Annonce annonce) {
        // Sauvegarder les plantes s'il y en a de nouvelles
        for (Plante plante : annonce.getPlantes_annonce()) {
            if (plante.getId() == null) {
                planteRepository.save(plante);
            }
        }
        annonceRepository.save(annonce);
        entityManager.flush();
        return annonce;
    }

    public Annonce getAnnonceDetails(Long annonceId) {
        return annonceRepository.findAnnonceDetails(annonceId);
    }

    public Iterable<Annonce> getAnnoncesByUtilisateur(Long utilisateurId) {
        return annonceRepository.findAnnoncesByUtilisateurId(utilisateurId);
    }


    // Recupérer les annonces en cours d'un utilisateur par son adresse
    public List<Annonce> getAnnoncesEnCoursByAdresseUtilisateur(String adresseUtilisateur) {
        return annonceRepository.findAnnoncesEnCoursByAdresseUtilisateur(adresseUtilisateur);
    }

    // Recupérer les annonces en cours
    public List<Annonce> getAnnoncesEnCours() {
        LocalDate now = LocalDate.now();
        return annonceRepository.findByDateDebutBeforeAndDateFinAfter(now, now);
    }


    /*
    *

    public Annonce addAnnonce(Annonce annonce, Long planteId) {
        Plante plante = planteRepository.findById(planteId).orElseThrow(() -> new EntityNotFoundException("Plante non trouvée avec l'ID: " + planteId));
        annonce.setPlante(plante);
        return annonceRepository.save(annonce);
    }
    *
    * */


}
