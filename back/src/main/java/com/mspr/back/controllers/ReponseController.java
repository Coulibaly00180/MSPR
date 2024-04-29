package com.mspr.back.controllers;

import com.mspr.back.services.ReponseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reponses")
public class ReponseController {

    @Autowired
    private ReponseService reponseService;

    //Pour accepter une reponse
    @PutMapping("/accepter/{idAnnonce}/{idUtilisateur}")
    public ResponseEntity<String> accepterReponse(@PathVariable Long idAnnonce, @PathVariable Long idUtilisateur) {
        reponseService.accepterReponse(idAnnonce, idUtilisateur);
        return ResponseEntity.ok("Reponse acceptée avec succès.");
    }

}
