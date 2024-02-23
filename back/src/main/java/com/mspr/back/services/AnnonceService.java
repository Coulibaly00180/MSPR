package com.mspr.back.services;

import com.mspr.back.entities.Annonce;
import com.mspr.back.repositories.AnnonceRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@Service
public class AnnonceService {

    @Autowired
    private AnnonceRepository annonceRepository;

    public Optional<Annonce> getAnnonce(final Long id) {
        return annonceRepository.findById(id);
    }

    public Iterable<Annonce> getAnnonces() {
        return annonceRepository.findAll();
    }

    public void deleteAnnonce(final Long id) {
        annonceRepository.deleteById(id);
    }

    public Annonce saveAnnonce(Annonce annonce) {
        return annonceRepository.save(annonce);
    }


}
