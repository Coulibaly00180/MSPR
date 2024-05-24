package com.mspr.back.controllers;

import com.mspr.back.entities.Annonce;
import com.mspr.back.services.AnnonceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/annonces")
public class AnnonceController {

    @Autowired
    private final AnnonceService annonceService;

    public AnnonceController(AnnonceService annonceService) {
        this.annonceService = annonceService;
    }

    // ajouter une annonce
    @PostMapping("/add")
    public Annonce addAnnonce(@RequestBody Annonce annonce) {
        return annonceService.addAnnonce(annonce);
    }

    /*
    @GetMapping("/{id}")
    public Annonce getAnnonceById(@PathVariable Long id) {
        return annonceService.getAnnonce(id)
                .orElseThrow(() -> new RuntimeException("Annonce non trouvée par l'id " + id));
    }

     */

    // Recuperer toutes les annonces des utilisateurs
    @GetMapping("/allannonces")
    public Iterable<Annonce> getAllAnnonces() {
        return annonceService.getAnnonces();
    }


    // Les annonces d'un utilisateurs
    @GetMapping("/utilisateur/{utilisateurId}")
    public Iterable<Annonce> getAnnoncesByUtilisateur(@PathVariable Long utilisateurId) {
        return annonceService.getAnnoncesByUser(utilisateurId);
    }

    // recuperer les details d'une annonce
    @GetMapping("/{annonceId}")
    public Annonce getAnnonceDetails(@PathVariable Long annonceId) {
        return annonceService.getAnnonceDetails(annonceId);
    }


    // Supprimer une annonce
    @DeleteMapping("/{id}")
    public void deleteAnnonce(@PathVariable Long id) {
        annonceService.deleteAnnonce(id);
    }


    @GetMapping("/en-cours/{adresseUtilisateur}")
    public List<Annonce> getAnnoncesEnCoursByAdresseUtilisateur(@PathVariable String userAddress) {
        return annonceService.getAnnoncesEnCoursByAdresseUser(userAddress);
    }

    @GetMapping("/encours")
    public List<Annonce> getAnnoncesEnCours() {
        return annonceService.getAnnoncesEnCours();
    }
}
