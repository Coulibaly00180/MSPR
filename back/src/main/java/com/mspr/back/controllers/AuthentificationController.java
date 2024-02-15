package com.mspr.back.controllers;

import com.mspr.back.services.AuthentificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/authentification")
public class AuthentificationController {

    private final AuthentificationService authentificationService;

    @Autowired
    public AuthentificationController(AuthentificationService authentificationService) {
        this.authentificationService = authentificationService;
    }

    @PostMapping("/signin")
    public ResponseEntity<String> signIn(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        String password = request.get("password");

        if (authentificationService.authentificationUtilisateur(email,password)){
            return ResponseEntity.ok("Utilisateur bien authentifie");
        }
        else {
            return ResponseEntity.badRequest().body("Invalid credentials");
        }
    }


}
