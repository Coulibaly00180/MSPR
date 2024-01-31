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

    @ManyToMany(mappedBy = "annonces")
    private Set<Utilisateur> utilisateurs_repondants;

    @OneToMany(mappedBy = "annonce_publiee")
    private Set<Utilisateur> utilisateurs_publiant;

    @ManyToMany
    @JoinTable(name = "presenter",
            joinColumns = @JoinColumn(name = "id_annonce", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "id_plante", referencedColumnName = "id")
    )
    private Set<Plante> plantes;

}
