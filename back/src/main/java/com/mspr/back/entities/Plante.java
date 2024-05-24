package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "Plante")
public class Plante {

    @Id
    @Column(name="id")
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

    // la ou les annonces concernant la plantes
    @ManyToMany(mappedBy = "plantes_annonce")
    private Set<Annonce> annonces;

    //Le botaniste qui ajoute la plante
    /*@ManyToMany(mappedBy = "plantes_ajoutees")
    * private Set<Botaniste> botaniste_ajout;
    *
     */

    // Les commentaires des botanistes
    @OneToMany(mappedBy = "plante")
    private Set<Commentaire> commentaires;

    @ManyToOne
    @JoinColumn(name="utilisateur_id")
    private User user;

    public Plante() {
        annonces = new HashSet<Annonce>();
        commentaires = new HashSet<Commentaire>();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public Set<Annonce> getAnnonces() {
        return annonces;
    }

    public void setAnnonces(Set<Annonce> annonces) {
        this.annonces = annonces;
    }

    public Set<Commentaire> getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(Set<Commentaire> commentaires) {
        this.commentaires = commentaires;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}


