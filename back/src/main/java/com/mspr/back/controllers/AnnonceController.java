package com.mspr.back.controllers;

import com.mspr.back.entities.Annonce;
import com.mspr.back.services.AnnonceService;
import com.mspr.back.services.PlanteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
        return annonceService.saveAnnonce(annonce);
    }

    @GetMapping("/{id}")
    public Annonce getAnnonceById(@PathVariable Long id) {
        return annonceService.getAnnonce(id)
                .orElseThrow(() -> new RuntimeException("Annonce non trouvée par l'id " + id));
    }


    @GetMapping("/allannonces")
    public Iterable<Annonce> getAllAnnonces() {
        return annonceService.getAnnonces();
    }

    @DeleteMapping("/{id}")
    public void deleteAnnonce(@PathVariable Long id) {
        annonceService.deleteAnnonce(id);
    }

}
