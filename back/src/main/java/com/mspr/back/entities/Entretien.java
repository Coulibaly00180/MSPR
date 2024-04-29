package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.net.URL;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "Entretien")
public class Entretien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "datetime_entretien", nullable = false)
    private LocalDateTime dateTime;

    @Column(name = "description_entretien", nullable = false)
    private String description;

    @Column(name = "urlphoto_entretien", nullable = false)
    private URL photo;

    @OneToMany(mappedBy = "entretien")
    private Set<Commentaire> commentaires;

    @OneToOne
    @JoinColumn(name = "id_annonce", unique = true)
    private Annonce annonce;

   public Entretien() {
       commentaires = new HashSet<Commentaire>();
   }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public URL getPhoto() {
        return photo;
    }

    public void setPhoto(URL photo) {
        this.photo = photo;
    }

    public Set<Commentaire> getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(Set<Commentaire> commentaires) {
        this.commentaires = commentaires;
    }

    public Annonce getAnnonce() {
        return annonce;
    }

    public void setAnnonce(Annonce annonce) {
        this.annonce = annonce;
    }
}
