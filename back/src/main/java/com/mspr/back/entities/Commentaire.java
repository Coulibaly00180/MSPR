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

}
