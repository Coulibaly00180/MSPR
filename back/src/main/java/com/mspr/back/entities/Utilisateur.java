package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Set;

@Data
@Entity
@Table(name = "Utilisateur")
public class Utilisateur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "pseudo_utilisateur", nullable = false, unique = true)
    private String pseudo;

    @Column(name = "password_utilisateur", nullable = false)
    private String password;

    @Column(name = "email_utilisateur", unique = true)
    private String email;

    @Column(name = "nom_utilisateur", nullable = false)
    private String nom;

    @Column(name = "prenom_utilisateur", nullable = false)
    private String prenom;


    @Column(name = "adresse_utilisateur", nullable = false)
    private String adresse;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "repondre",
            joinColumns = @JoinColumn(name = "id_utilisateur", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "id_annonce", referencedColumnName = "id")
    )
    private Set<Annonce> annonces_repondues;


    @OneToMany(mappedBy = "utilisateur_publiant")
    private Set<Annonce> annonces_publiees;


    @OneToMany(mappedBy = "utilisateur")
    Set <Commentaire> commentaires;


}
