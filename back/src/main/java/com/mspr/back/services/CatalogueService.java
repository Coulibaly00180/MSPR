package com.mspr.back.services;

import com.mspr.back.entities.Catalogue;
import com.mspr.back.repositories.CatalogueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class CatalogueService {
    @Autowired
    private CatalogueRepository catalogueRepository;

    public Optional<Catalogue> getCatalogue(final Long id) {
        return catalogueRepository.findById(id);
    }

    public Iterable<Catalogue> getCatalogue() {
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
