package com.mspr.back.services;

import com.mspr.back.entities.Annonce;
import com.mspr.back.entities.Botaniste;
import com.mspr.back.repositories.BotanisteRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@Service
public class BotanisteService {

    @Autowired
    private BotanisteRepository botanisteRepository;

    public Optional<Botaniste> getBotaniste(final Long id) {
        return botanisteRepository.findById(id);
    }

    public Iterable<Botaniste> getBotanistes() {
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
