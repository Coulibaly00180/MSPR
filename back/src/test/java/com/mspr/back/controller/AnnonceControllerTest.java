package com.mspr.back.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mspr.back.TestConfig;
import com.mspr.back.controllers.AnnonceController;
import com.mspr.back.entities.Annonce;
import com.mspr.back.repositories.AnnonceRepository;
import com.mspr.back.services.AnnonceService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@WebMvcTest(AnnonceController.class)
@ContextConfiguration(classes = TestConfig.class)
public class AnnonceControllerTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private ObjectMapper objectMapper;
    @MockBean
   private AnnonceService annonceService;

    @Test
    public void testPublicationAnnonce() throws Exception {
        // Créer une annonce de test
        Annonce annonce = new Annonce();
        annonce.setTitreAnnonce("Test Titre");
        annonce.setDateDebut(LocalDate.now());
        annonce.setDateFin(LocalDate.now().plusDays(7));

        // Convertir l'annonce en JSON
        String annonceJson = objectMapper.writeValueAsString(annonce);

        // Configurer le comportement attendu du service
        Mockito.when(annonceService.addAnnonce(Mockito.any(Annonce.class))).thenReturn(annonce);

        // Effectuer la requête POST avec MockMvc
        mockMvc.perform(MockMvcRequestBuilders.post("/annonces/add")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(annonceJson))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.titreAnnonce").value("Test Titre"));
    }




/*
    @Test
    public void testGetAnnonceEncours() throws Exception{
        mockMvc.perform(get("api/v1/annonces/encours"))
                .andExpect(status().isOk());
    }

 */

    /*
    @Test
    public void testGetAnnonceEncours() throws Exception{
        final String titre = "garde de joncquille";
        assertEquals(titre,annonceRepository.findByDateFin(LocalDate.ofEpochDay(2024-03-07)));
    }

     */

}


