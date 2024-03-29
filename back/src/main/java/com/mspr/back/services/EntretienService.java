package com.mspr.back.services;

import com.mspr.back.entities.Entretien;
import com.mspr.back.repositories.EntretienRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@Service
public class EntretienService {

    @Autowired
    private EntretienRepository entretienRepository;

    public Optional<Entretien> getEntretien(final Long id) {
        return entretienRepository.findById(id);
    }

    public Iterable<Entretien> getEntretiens() {
        return entretienRepository.findAll();
    }

    public void deleteEntretien(final Long id) {
        entretienRepository.deleteById(id);
    }

    public Entretien saveEntretien(Entretien entretien) {
        Entretien savedEntretien = entretienRepository.save(entretien);
        return savedEntretien;

    }


}
