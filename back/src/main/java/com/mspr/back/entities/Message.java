package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Time;
import java.util.Date;

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
    @JoinColumn(name = "id_utilisateur1")
    private Utilisateur expediteur;

    @ManyToOne
    @JoinColumn(name = "id_utilisateur2")
    private Utilisateur destinataire;

    public Message(){}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
    }

    public Date getDate_envoie() {
        return date_envoie;
    }

    public void setDate_envoie(Date date_envoie) {
        this.date_envoie = date_envoie;
    }

    public Date getDate_reception() {
        return date_reception;
    }

    public void setDate_reception(Date date_reception) {
        this.date_reception = date_reception;
    }

    public Time getHeure_envoie() {
        return heure_envoie;
    }

    public void setHeure_envoie(Time heure_envoie) {
        this.heure_envoie = heure_envoie;
    }

    public Time getHeure_reception() {
        return heure_reception;
    }

    public void setHeure_reception(Time heure_reception) {
        this.heure_reception = heure_reception;
    }

    public boolean isAccuse_reception() {
        return accuse_reception;
    }

    public void setAccuse_reception(boolean accuse_reception) {
        this.accuse_reception = accuse_reception;
    }

    public Utilisateur getExpediteur() {
        return expediteur;
    }

    public void setExpediteur(Utilisateur expediteur) {
        this.expediteur = expediteur;
    }

    public Utilisateur getDestinataire() {
        return destinataire;
    }

    public void setDestinataire(Utilisateur destinataire) {
        this.destinataire = destinataire;
    }
}
