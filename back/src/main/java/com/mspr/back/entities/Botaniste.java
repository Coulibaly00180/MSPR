package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "Botaniste")
public class Botaniste {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "email_botaniste", nullable = false, unique = true)
    private String email;

    @Column(name = "pseudo_botaniste", nullable = false, unique = true)
    private String pseudo;

    @Column(name = "password_botaniste", nullable = false)
    private String password;

    @Column(name = "nom_botaniste", nullable = false)
    private String nom;

    @Column(name = "prenom_botaniste", nullable = false)
    private String prenom;

    @Column(name = "adresse_botaniste", nullable = false)
    private String adresse;

    // Plantes ajoutees par le botaniste
    /*@ManyToMany(fetch = FetchType.EAGER)
    *@JoinTable(name = "ajouter",
    *        joinColumns = @JoinColumn(name = "id_botaniste", referencedColumnName = "id"),
    *        inverseJoinColumns = @JoinColumn(name = "id_plante", referencedColumnName = "id")
    *)
    *private Set<Plante> plantes_ajoutees;
    *
     */

    @OneToMany(mappedBy = "botaniste")
    Set <Commentaire> commentaires;

    public Botaniste() {
        commentaires = new HashSet<Commentaire>();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public Set<Commentaire> getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(Set<Commentaire> commentaires) {
        this.commentaires = commentaires;
    }
}
