package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.net.URL;
import java.time.LocalDateTime;

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


}
