package com.mspr.back.controllers;


import com.mspr.back.custom_exception.EntityAlreadyExistsException;
import com.mspr.back.entities.Utilisateur;
import com.mspr.back.services.UtilisateurService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;


@AllArgsConstructor
@RequestMapping("/users")
@RestController
public class UtilisateurController {

    public UtilisateurService utilisateurService;

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/login")
    public void inscrire(@RequestBody Utilisateur utilisateur) throws EntityAlreadyExistsException {
        this.utilisateurService.saveUtilisateur(utilisateur);
    }
}
