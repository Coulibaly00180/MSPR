package com.mspr.back.controllers;

import com.mspr.back.entities.Utilisateur;
import com.mspr.back.services.UtilisateurService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/utilisateurs")
public class UtilisateurController {
    @Autowired
    private final UtilisateurService utilisateurService;

    @MessageMapping("/utilisateur.addUtilisateur")
    @SendTo("/utilisateur/topic")
    public Utilisateur addUtilisateur( @Payload Utilisateur utilisateur){
        utilisateurService.saveUtilisateur(utilisateur);
        return utilisateur;
    }

    @MessageMapping("/utilisateur.deconnectUtilisateur")
    @SendTo("/utilisateur/topic")
    public Utilisateur deconnect ( @Payload Utilisateur utilisateur){
        utilisateurService.deconnect(utilisateur);
        return utilisateur;
    }

    @GetMapping("/utilisateurs")
    public ResponseEntity<List<Utilisateur>> findConnectUtilisateurs(){
        return ResponseEntity.ok(utilisateurService.findUtilisateursConnectes());
    }

    @GetMapping
    public Iterable<Utilisateur> getAllUtilisateurs() {
        return utilisateurService.getAllUtilisateurs();
    }

    @GetMapping("/{id}")
    public Utilisateur getUtilisateurById(@PathVariable Long id) {
        return utilisateurService.getUtilisateurById(id);
    }

    @PostMapping
    public Utilisateur saveUtilisateur(@RequestBody Utilisateur utilisateur) {
        return utilisateurService.saveUtilisateur(utilisateur);
    }

    @PutMapping("/{id}")
    public Utilisateur updateUtilisateur(@PathVariable Long id, @RequestBody Utilisateur utilisateurDetails) {
        Utilisateur utilisateur = utilisateurService.getUtilisateurById(id);
        if (utilisateur != null) {
            utilisateur.setNom(utilisateurDetails.getNom());
            utilisateur.setPrenom(utilisateurDetails.getPrenom());
            utilisateur.setEmail(utilisateurDetails.getEmail());
            utilisateur.setPassword(utilisateurDetails.getPassword());
            return utilisateurService.saveUtilisateur(utilisateur);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteUtilisateur(@PathVariable Long id) {
        utilisateurService.deleteUtilisateur(id);
    }

}
