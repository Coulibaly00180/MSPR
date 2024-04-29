package com.mspr.back.services;

import com.mspr.back.entities.Plante;
import com.mspr.back.entities.Reponse;
import com.mspr.back.entities.ReponseKey;
import com.mspr.back.repositories.ReponseRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Data
@Service
public class ReponseService {

    @Autowired
    private ReponseRepository reponseRepository;

    // accepter une reponse
    @Transactional
    public void accepterReponse(Long idAnnonce, Long idUtilisateur) {
        Reponse reponse = reponseRepository.findById(new ReponseKey(idAnnonce, idUtilisateur)).orElse(null);
        if (reponse != null) {
            reponse.setAccepte(true);
            reponseRepository.save(reponse);
        }
    }

    public Optional<Reponse> getReponse(final ReponseKey id) {
        return reponseRepository.findById(id);
    }

    public Iterable<Reponse> getReponses() {
        return reponseRepository.findAll();
    }

    public void deleteReponse(final ReponseKey id) {
        reponseRepository.deleteById(id);
    }

    public Reponse savePlante(Reponse reponse) {
        Reponse savedReponse = reponseRepository.save(reponse);
        return savedReponse;
    }
}
