package com.mspr.back.services;

import com.mspr.back.dto.AnnonceDto;
import com.mspr.back.entities.Annonce;
import com.mspr.back.entities.Plante;
import com.mspr.back.entities.User;
import com.mspr.back.repositories.AnnonceRepository;
import com.mspr.back.repositories.PlanteRepository;
import com.mspr.back.repositories.UserRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Data
@Service
@Transactional
public class AnnonceService {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private AnnonceRepository annonceRepository;

    @Autowired
    private final UserRepository userRepository;

    @Autowired
    private PlanteRepository planteRepository;

    private final Path rootLocation = Paths.get("uploads");


    public AnnonceService(AnnonceRepository annonceRepository, UserRepository userRepository) {
        this.annonceRepository = annonceRepository;
        this.userRepository = userRepository;
    }


    public Annonce createAnnonce(AnnonceDto annonceDto, int userId, MultipartFile photoFile) throws IOException {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Utilisateur not found"));

        String photoFilename = savePhoto(photoFile);

        Annonce annonce = Annonce.builder()
                .titreAnnonce(annonceDto.getTitre())
                .dateDebut(annonceDto.getDateDebut())
                .dateFin(annonceDto.getDateFin())
                .photoPlante(photoFilename)
                .user(user)
                .build();

        return annonceRepository.save(annonce);
    }

    private String savePhoto(MultipartFile photoFile) throws IOException {
        if (photoFile.isEmpty()) {
            throw new IllegalArgumentException("Photo file is empty");
        }
        String filename = UUID.randomUUID().toString() + "_" + photoFile.getOriginalFilename();
        Files.copy(photoFile.getInputStream(), this.rootLocation.resolve(filename));
        return filename;
    }















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
