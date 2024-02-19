package com.mspr.back.controllers;


import com.mspr.back.custom_exception.EntityAlreadyExistsException;
import com.mspr.back.entities.Utilisateur;
import com.mspr.back.services.UtilisateurService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;


@AllArgsConstructor
@RequestMapping("/")
@RestController
public class UtilisateurController {

    public UtilisateurService utilisateurService;

    @ResponseStatus(HttpStatus.CREATED)
    @GetMapping("/login")
    //public void login(@RequestBody String email, String password) throws EntityAlreadyExistsException {
    public void login(@RequestParam(name = "id") String email, @RequestParam String password )  {
        System.out.println(email + " " + password);
        this.utilisateurService.login(email, password);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/register")
    public void register(@RequestBody Utilisateur utilisateur) throws EntityAlreadyExistsException {
        this.utilisateurService.register(utilisateur);
    }
}
