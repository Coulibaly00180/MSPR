package com.mspr.back.entities;

import jakarta.persistence.*;

import java.awt.*;
import java.net.URL;
import java.time.LocalDateTime;

@Entity
public class Commentaire {

    @EmbeddedId
    CommentaireKey id;

    @ManyToOne
    @MapsId("utilisateur_id")
    @JoinColumn(name = "utilisateur_id")
    private Utilisateur utilisateur;

    @ManyToOne
    @MapsId("botaniste_id")
    @JoinColumn(name = "botaniste_id")
    private Botaniste botaniste;

    @ManyToOne
    @MapsId("annonce_id")
    @JoinColumn(name = "annonce_id")
    private Annonce annonce;

    private Integer numEntretien;
    private String texte;

}
