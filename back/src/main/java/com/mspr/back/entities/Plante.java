package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;
import  com.mspr.back.entities.Botaniste;

import java.util.Set;

@Data
@Entity
@Table(name = "Plante")
public class Plante {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nom_plante", nullable = false)
    private String nom;

    @Column(name = "photo_plante", nullable = false)
    private String photo;

    @Column(name = "description_plante", nullable = false)
    private String description;

    @Column(name = "categorie_plante", nullable = true)
    private String categorie;

    @ManyToOne
    @JoinColumn(name = "id_annonce")
    private Annonce  annonces;

    //Le botaniste qui ajoute la plante
    @ManyToOne
    @JoinColumn(name = "id_botaniste")
    private Botaniste botaniste_ajout;

}


