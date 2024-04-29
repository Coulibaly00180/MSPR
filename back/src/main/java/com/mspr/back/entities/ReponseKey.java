package com.mspr.back.entities;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ReponseKey implements Serializable {

    @Column(name = "utilisateur_id")
    Long utilisateur_id;

    @Column(name = "annonce_id")
    Long annonce_id;

    public ReponseKey(Long annonce_id, Long utilisateur_id) {
        this.utilisateur_id = utilisateur_id;
        this.annonce_id = annonce_id;
    }

    public ReponseKey() {

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReponseKey that = (ReponseKey) o;
        return Objects.equals(utilisateur_id, that.utilisateur_id) && Objects.equals(annonce_id, that.annonce_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(utilisateur_id, annonce_id);
    }
}
