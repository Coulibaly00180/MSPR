package com.mspr.back.services;

import com.mspr.back.entities.Annonce;
import com.mspr.back.entities.Entretien;
import com.mspr.back.repositories.EntretienRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Data
@Service
public class EntretienService {

    @Autowired
    private EntretienRepository entretienRepository;

    @Transactional
    public void associerEntretienAAnnonce(Long idAnnonce, Long idEntretien) {
        Annonce annonce = new Annonce();
        annonce.setId(idAnnonce);

        Entretien entretien = new Entretien();
        entretien.setId(idEntretien);
        entretien.setAnnonce(annonce);

        entretienRepository.save(entretien);
    }

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
