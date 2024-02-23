package com.mspr.back.entities;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.awt.*;
import java.net.URL;
import java.time.LocalDateTime;

@Entity
public class Commentaire {

    @EmbeddedId
    CommentaireKey id;

    @ManyToOne
    @MapsId("plante_id")
    @JoinColumn(name = "plante_id")
    private Plante plante;

    @ManyToOne
    @MapsId("botaniste_id")
    @JoinColumn(name = "botaniste_id")
    private Botaniste botaniste;

    @ManyToOne
    @MapsId("entretien_id")
    @JoinColumn(name = "entretien_id")
    private Entretien entretien;

    private String texte;
    private LocalDateTime dateTime;

    public Commentaire(){ }

    public CommentaireKey getId() {
        return id;
    }

    public void setId(CommentaireKey id) {
        this.id = id;
    }

    public Plante getPlante() {
        return plante;
    }

    public void setPlante(Plante plante) {
        this.plante = plante;
    }

    public Botaniste getBotaniste() {
        return botaniste;
    }

    public void setBotaniste(Botaniste botaniste) {
        this.botaniste = botaniste;
    }

    public Entretien getEntretien() {
        return entretien;
    }

    public void setEntretien(Entretien entretien) {
        this.entretien = entretien;
    }

    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }
}
