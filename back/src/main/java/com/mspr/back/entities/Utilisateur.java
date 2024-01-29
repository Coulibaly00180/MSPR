package com.mspr.back.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Utilisateur")
public class Utilisateur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username_utilisateur", nullable = false, unique = true)
    private String username;

    @Column(name = "password_utilisateur", nullable = false)
    private String password;

    @Column(name = "email_utilisateur", unique = true)
    private String email;

    @Column(name = "nom_utilisateur", nullable = false)
    private String nom;

    @Column(name = "prenom_utilisateur", nullable = false)
    private String prenom;

    @Column(name = "role_utilisateur", nullable = false)
    private String role;

    @Column(name = "adresse_utilisateur", nullable = false)
    private String adresse;
}
