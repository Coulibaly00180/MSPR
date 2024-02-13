package com.mspr.back.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CommentaireKey implements Serializable {

    @Column(name = "utilisateur_id")
    Long utilisateur_id;

    @Column(name = "annonce_id")
    Long annonce_id;

    @Column(name = "botaniste_id")
    Long botaniste_id;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommentaireKey that = (CommentaireKey) o;
        return Objects.equals(utilisateur_id, that.utilisateur_id) && Objects.equals(annonce_id, that.annonce_id) && Objects.equals(botaniste_id, that.botaniste_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(utilisateur_id, annonce_id, botaniste_id);
    }
}
