package com.mspr.back.entities;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
public class Reponse {

    @EmbeddedId
    ReponseKey id;

    @ManyToOne
    @MapsId("utilisateur_id")
    @JoinColumn(name = "utilisateur_id")
    private Utilisateur utilisateur;

    @ManyToOne
    @MapsId("annonce_id")
    @JoinColumn(name = "annonce_id")
    private Annonce annonce;

    private boolean accepte;

    private LocalDateTime dateTime;

}
