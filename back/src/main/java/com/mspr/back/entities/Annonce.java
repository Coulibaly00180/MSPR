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
    //@ManyToMany(mappedBy = "annonces_repondues")
    //private Set<Utilisateur> utilisateurs_repondants;

    //Utilisateurs publiant une annonce
    //@ManyToOne
    //@JoinColumn(name = "id_utilisateur")
    //private Utilisateur utilisateur_publiant;


    // La ou les plantes présentent dans une annonce
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "presente",
            joinColumns = @JoinColumn(name = "id_annonce", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "id_plante", referencedColumnName = "id")
    )
    private Set<Plante> plantes_annonce;


    @OneToMany(mappedBy = "annonce")
    private Set <Commentaire> commentaires;

}
