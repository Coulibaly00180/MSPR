package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Set;

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

    // Plantes ajoutees par le botaniste
    @OneToMany(mappedBy = "botaniste_ajout")
    private Set<Plante> plantes_ajoutees;

    @OneToMany(mappedBy = "botaniste")
    Set <Commentaire> commentaires;
}
