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

    public Reponse() {
    }

    public ReponseKey getId() {
        return id;
    }

    public void setId(ReponseKey id) {
        this.id = id;
    }

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

    public Annonce getAnnonce() {
        return annonce;
    }

    public void setAnnonce(Annonce annonce) {
        this.annonce = annonce;
    }

    public boolean isAccepte() {
        return accepte;
    }

    public void setAccepte(boolean accepte) {
        this.accepte = accepte;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }
}
