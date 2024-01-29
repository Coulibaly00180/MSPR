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
@Table(name = "Botanistes")
public class Botaniste {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "email_botaniste", nullable = false, unique = true)
    private String email;

    @Column(name = "username_botaniste", nullable = false, unique = true)
    private String username;

    @Column(name = "password_botaniste", nullable = false)
    private String password;

    @Column(name = "nom_botaniste", nullable = false)
    private String nom;

    @Column(name = "prenom_botaniste", nullable = false)
    private String prenom;

    @Column(name = "adresse_botaniste", nullable = false)
    private String adresse;
}
