package com.mspr.back.services;

import com.mspr.back.entities.Catalogue;
import com.mspr.back.repositories.CatalogueRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@Service
public class CatalogueService {
    @Autowired
    private CatalogueRepository catalogueRepository;

    public Optional<Catalogue> getCatalogue(final Long id) {
        return catalogueRepository.findById(id);
    }

    public Iterable<Catalogue> getCatalogues() {
        return catalogueRepository.findAll();
    }

    public void deleteCatalogue(final Long id) {
        catalogueRepository.deleteById(id);
    }

    public Catalogue saveCatalogue(Catalogue catalogue) {
        Catalogue savedCatalogue = catalogueRepository.save(catalogue);
        return savedCatalogue;
    }
}
