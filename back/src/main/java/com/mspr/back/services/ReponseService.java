package com.mspr.back.services;

import com.mspr.back.entities.Plante;
import com.mspr.back.entities.Reponse;
import com.mspr.back.repositories.ReponseRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@Service
public class ReponseService {

    @Autowired
    private ReponseRepository reponseRepository;

    public Optional<Reponse> getReponse(final Long id) {
        return reponseRepository.findById(id);
    }

    public Iterable<Reponse> getReponses() {
        return reponseRepository.findAll();
    }

    public void deleteReponse(final Long id) {
        reponseRepository.deleteById(id);
    }

    public Reponse savePlante(Reponse reponse) {
        Reponse savedReponse = reponseRepository.save(reponse);
        return savedReponse;
    }
}
