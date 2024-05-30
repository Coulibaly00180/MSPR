package com.mspr.back.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@RequiredArgsConstructor
public class AnnonceDto {
    private String titre;
    private LocalDate dateDebut;
    private LocalDate dateFin;
}
