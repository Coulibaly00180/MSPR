package com.mspr.back.services;

import com.mspr.back.entities.Annonce;
import com.mspr.back.entities.Botaniste;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class BotanisteService {

    @Autowired
    private BotanisteRepository botanisteRepository;

    public Optional<Botaniste> getBotaniste(final Long id) {
        return botanisteRepository.findById(id);
    }

    public Iterable<Botaniste> getBotaniste() {
        return botanisteRepository.findAll();
    }

    public void deleteBotaniste(final Long id) {
        botanisteRepository.deleteById(id);
    }

    public Botaniste saveBotaniste(Botaniste botaniste) {
        Botaniste savedBotaniste = botanisteRepository.save(botaniste);
        return savedBotaniste;
    }
}
