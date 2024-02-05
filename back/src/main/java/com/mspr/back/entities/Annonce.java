package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;
import java.util.Set;


@Data
@Entity
@Table(name = "Annonce")
public class Annonce {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "titre_annonce", nullable = false)
    private String titreAnnonce;

    @Column(name = "date_debut", nullable = false)
    private LocalDate dateDebut;

    @Column(name = "date_fin", nullable = false)
    private LocalDate dateFin;

    //Utilisateurs repondants aux annonces
    @ManyToMany(mappedBy = "annonces-repondues")
    private Set<Utilisateur> utilisateurs_repondants;

    //Utilisateurs publiant une annonce
    @OneToMany(mappedBy = "annonce_publiee")
    private Set<Utilisateur> utilisateurs_publiant;

    // les plantes concernant une annonce
    @OneToMany(mappedBy = "annonces")
    private Set<Plante> plantes;

    @OneToMany(mappedBy = "annonce")
    Set <Commentaire> commentaires;

}
