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

    @PostMapping
    public void envoyerMessage(@RequestBody Message message) {
        messageService.envoyerMessage(message);
    }

    /*
    @GetMapping("/{idUtilisateur}")
    public List<Message> getMessagesUtilisateur(@PathVariable Long idUtilisateur) {
        return messageService.getMessagesUtilisateur(idUtilisateur);
    }

     */

}
