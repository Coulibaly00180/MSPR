package com.mspr.back.controllers;

import com.mspr.back.entities.Utilisateur;
import com.mspr.back.services.UtilisateurService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class UtilisateurController {

    private final UtilisateurService utilisateurService;

    @MessageMapping("/addUtilisateur")
    @SendTo("/utilisateur/topic")
    public Utilisateur addUtilisateur( @Payload Utilisateur utilisateur){
        utilisateurService.saveUtilisateur(utilisateur);
        return utilisateur;
    }

    @MessageMapping("/deconnectUtilisateur")
    @SendTo("/utilisateur/topic")
    public Utilisateur deconnect ( @Payload Utilisateur utilisateur){
        utilisateurService.deconnect(utilisateur);
        return utilisateur;
    }

    @GetMapping
    public ResponseEntity<List<Utilisateur>> findConnectUtilisateurs(){
        return ResponseEntity.ok(utilisateurService.findUtilisateursConnectes());
    }
}
