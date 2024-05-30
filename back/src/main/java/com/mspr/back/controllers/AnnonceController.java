package com.mspr.back.controllers;

import com.mspr.back.entities.Annonce;
import com.mspr.back.services.AnnonceService;
import com.mspr.back.services.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/annonces")
public class AnnonceController {

    @Autowired
    private final AnnonceService annonceService;
    private final JwtService jwtService;

    public AnnonceController(AnnonceService annonceService, JwtService jwtService) {

        this.annonceService = annonceService;
        this.jwtService = jwtService;
    }

    // ajouter une annonce

    /*@PostMapping
    public ResponseEntity<Annonce> createAnnonce(@RequestParam("titreAnnonce") String titreAnnonce,
                                                 @RequestParam("dateDebut") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateDebut,
                                                 @RequestParam("dateFin") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateFin,
                                                 @RequestParam("photoPlante") MultipartFile photoPlante) throws IOException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();

        AnnonceDto createAnnonceDto = new AnnonceDto();
        createAnnonceDto.setTitre(titreAnnonce);
        createAnnonceDto.setDateDebut(dateDebut);
        createAnnonceDto.setDateFin(dateFin);

        Annonce newAnnonce = annonceService.createAnnonce(createAnnonceDto, currentUser.getId(), photoPlante);

        return ResponseEntity.ok(newAnnonce);
    }

     */


   /* @PostMapping("/add")
    public Annonce addAnnonce(@RequestBody Annonce annonce) {
        return annonceService.addAnnonce(annonce);
    }

    */

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
