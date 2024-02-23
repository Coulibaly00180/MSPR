package com.mspr.back.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class CommentaireKey implements Serializable {

    @Column(name = "plante_id")
    Long plante_id;

    @Column(name = "entretien_id")
    Long entretien_id;

    @Column(name = "botaniste_id")
    Long botaniste_id;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommentaireKey that = (CommentaireKey) o;
        return Objects.equals(plante_id, that.plante_id) && Objects.equals(entretien_id, that.entretien_id) && Objects.equals(botaniste_id, that.botaniste_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(plante_id, entretien_id, botaniste_id);
    }
}
