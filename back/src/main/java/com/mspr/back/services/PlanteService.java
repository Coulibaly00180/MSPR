package com.mspr.back.services;

import com.mspr.back.entities.Plante;
import com.mspr.back.repositories.PlanteRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@Service
public class PlanteService {
    @Autowired
    private PlanteRepository planteRepository;

    public Optional<Plante> getPlante(final Long id) {
        return planteRepository.findById(id);
    }

    public Iterable<Plante> getPlantes() {
        return planteRepository.findAll();
    }

    public void deletePlante(final Long id) {
        planteRepository.deleteById(id);
    }

    public Plante savePlante(Plante plante) {
        Plante savedPlante = planteRepository.save(plante);
        return savedPlante;
    }
}
