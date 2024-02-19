package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.net.URL;
import java.time.LocalDateTime;
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
    private Annonce annonce;


}
