package com.mspr.back.services;

import com.mspr.back.entities.Message;
import com.mspr.back.repositories.MessageRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Data
@Service
public class MessageService {

    @Autowired
    private final MessageRepository messageRepository;

    public MessageService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    public void envoyerMessage(Message message) {
        // Logique pour envoyer le message
        messageRepository.save(message);
    }

    /*
    public List<Message> getMessagesUtilisateur(Long idUtilisateur) {
        // Logique pour récupérer les messages d'un utilisateur
        return messageRepository.findByExpediteurIdUtilisateurOrDestinataireIdUtilisateur(idUtilisateur, idUtilisateur);
    }

     */
}
