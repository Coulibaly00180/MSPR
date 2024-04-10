package com.mspr.back.controllers;

import com.mspr.back.entities.Message;
import com.mspr.back.services.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/messages")
public class MessageController {

    @Autowired
    private final MessageService messageService;

    public MessageController(MessageService messageService) {
        this.messageService = messageService;
    }

    //@PostMapping
    public void envoyerMessage(@RequestBody Message message) {
        messageService.envoyerMessage(message);
    }

    /*
    @GetMapping("/{idUtilisateur}")
    public List<Message> getMessagesUtilisateur(@PathVariable Long idUtilisateur) {
        return messageService.getMessagesUtilisateur(idUtilisateur);
    }

     */


    @GetMapping
    public List<Message> getAllMessages() {
        return messageService.getAllMessages();
    }

    @GetMapping("/{id}")
    public Message getMessageById(@PathVariable Long id) {
        return messageService.getMessageById(id);
    }

    @PostMapping
    public Message saveMessage(@RequestBody Message message) {
        return messageService.saveMessage(message);
    }

    @PutMapping("/{id}")
    public Message updateMessage(@PathVariable Long id, @RequestBody Message messageDetails) {
        Message message = messageService.getMessageById(id);
        if (message != null) {
            message.setExpediteur(messageDetails.getExpediteur());
            message.setDestinataire(messageDetails.getDestinataire());
            message.setTexte(messageDetails.getTexte());
            message.setDate_envoie(messageDetails.getDate_envoie());
            message.setAccuse_reception(messageDetails.isAccuse_reception());
            return messageService.saveMessage(message);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteMessage(@PathVariable Long id) {
        messageService.deleteMessage(id);
    }

}
