package com.mspr.back.controllers;

import com.mspr.back.entities.Utilisateur;
import com.mspr.back.services.AuthentificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/authentification")
public class AuthentificationController {

    private final AuthentificationService authentificationService;


    @Autowired
    public AuthentificationController(AuthentificationService authentificationService) {
        this.authentificationService = authentificationService;
    }

    // Pour gerer la connexion
    @PostMapping("/signin")
    public ResponseEntity<String> signIn(@RequestBody Map<String,String> request) {

        String email = request.get("email");
        String password = request.get("password");

        if (authentificationService.connecteUtilisateur(email,password)){
            return ResponseEntity.ok("Utilisateur bien connecté");
        }
        else {
            return ResponseEntity.badRequest().body("Utilisateur non reconnu");
        }
    }

    // Pour gerer l'inscription
    @PostMapping("/signup")
    public ResponseEntity<String> signup(@RequestBody Utilisateur utilisateur){

        try {

            // Verification des entrées
            //
            // validateInput(email,password);

            if (authentificationService.inscriptionUtilisateur(utilisateur)){
                return ResponseEntity.ok("L'utilisateur a été crée");
            }
            else {
                return ResponseEntity.badRequest().body("L'utilisateur existe déjà");
            }
        }


        catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.badRequest().body("L'email est déjà utilisé");
        }


        //authentificationService.inscriptionUtilisateur(utilisateur);


    }

    private void validateInput(String email, String password) {
        if (email == null || !email.matches("\\S+@\\S+\\.\\S+")) {
            throw new IllegalArgumentException("Invalid email format");
        }
        if (password == null || password.length() < 2) {
            throw new IllegalArgumentException("Le mot de passe doit contenir au moins 3 caractères");
        }
    }




}
