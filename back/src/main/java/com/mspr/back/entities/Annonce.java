package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;


@Data
@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "Annonce")
public class Annonce {
    
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "titre_annonce", nullable = false)
    private String titreAnnonce;

    @Column(name = "date_debut", nullable = false)
    private LocalDate dateDebut;

    @Column(name = "date_fin", nullable = false)
    private LocalDate dateFin;

    @Column(name = "photo_plante", nullable = false)
    private String photoPlante;


    @ManyToOne
    @JoinColumn(name = "user", nullable = false)
    private User user;

    //Utilisateurs repondants aux annonces
    @ManyToMany(mappedBy = "annonces_repondues")
    private Set<Utilisateur> utilisateurs_repondants;

    //Utilisateurs publiant une annonce
   /* @ManyToOne
    *@JoinColumn(name = "id_utilisateur")
    *private Utilisateur utilisateur_publiant;
    *
    */


    // La ou les plantes présentent dans une annonce
    @ManyToMany(cascade = CascadeType.PERSIST)
    @JoinTable(name = "mise_en_annonce",
            joinColumns = @JoinColumn(name = "id_annonce"),
            inverseJoinColumns = @JoinColumn(name = "id_plante")
    )
    private Set<Plante> plantes_annonce;

    @OneToMany(mappedBy = "annonce")
    private Set<Reponse> reponses;

    @OneToOne(mappedBy = "annonce", cascade = CascadeType.ALL)
    private Entretien entretien;


    // Constructeur
   /* public Annonce(String titreAnnonce, Set<Plante> plantes_annonce){
        this.titreAnnonce = titreAnnonce;
        this.plantes_annonce = plantes_annonce;
    }
    // Constructeur par defaut
    public Annonce() {
        reponses = new HashSet<Reponse>();
        plantes_annonce = new HashSet<Plante>();
        utilisateurs_repondants = new HashSet<Utilisateur>();
    }

    */

}
