package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Time;
import java.util.Date;

@Getter
@Setter
@Data
@Entity
@Table(name = "Message")
public class Message {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "texte", nullable = true)
    private String texte;

    @Column(name = "date_envoie", nullable = true)
    private Date date_envoie;

    @Column(name = "date_reception", nullable = true)
    private Date date_reception;

    @Column(name = "heure_envoie", nullable = true)
    private Time heure_envoie;

    @Column(name = "heure_reception", nullable = true)
    private Time heure_reception;

    @Column(name = "accuse_reception", nullable = true)
    private boolean accuse_reception;

    @ManyToOne
    @JoinColumn(name = "id_expediteur")
    private User expediteur;

    @ManyToOne
    @JoinColumn(name = "id_destinataire")
    private User destinataire;

    public Message(){}
}
