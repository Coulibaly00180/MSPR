package com.mspr.back.services;

import com.mspr.back.entities.Annonce;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class AnnonceService {
    @Autowired
    private AnnonceRepository annonceRepository;

    public Optional<Annonce> getAnnonce(final Long id) {
        return annonceRepository.findById(id);
    }

    public Iterable<Annonce> getAnnonce() {
        return annonceRepository.findAll();
    }

    public void deleteAnnonce(final Long id) {
        annonceRepository.deleteById(id);
    }

    public Annonce saveAnnonce(Annonce annonce) {
        Annonce savedAnnonce = annonceRepository.save(annonce);
        return savedAnnonce;
    }
}
