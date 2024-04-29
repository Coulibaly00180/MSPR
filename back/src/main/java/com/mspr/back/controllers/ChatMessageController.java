package com.mspr.back.controllers;

import com.mspr.back.entities.ChatMessage;
import com.mspr.back.services.ChatMessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/chatMessages")
public class ChatMessageController {

    private final SimpMessagingTemplate messagingTemplate;
    private final ChatMessageService chatMessageService;

    //@MessageMapping("/chat")
    public void processMessage(@Payload ChatMessage chatMessage){
        ChatMessage savedMsg = chatMessageService.save(chatMessage);
        /*
        messagingTemplate.convertAndSendToUser(
                String.valueOf(chatMessage.getRecipient().getId()), "/queue/messages",
                ChatNotification.builder()
                        .id(savedMsg.getId())
                        .sender(savedMsg.getSender())
                        .recipient(savedMsg.getRecipient())
                        .build()
        );

         */
    }

    @PostMapping("/chat")
    public ResponseEntity<String> sendMessage(@RequestBody ChatMessage chatMessage){
        chatMessageService.save(chatMessage);
        return ResponseEntity.ok("Message envoyé");
    }

    /*
    @GetMapping("/messages/{senderId}/{recipientId}")
    public ResponseEntity<List<ChatMessage>> findChatMessages(@PathVariable("senderId") Long senderId, @PathVariable("recipientId") Long recipientId ){
        return ResponseEntity.ok(chatMessageService.findChatMessage(senderId,recipientId));
    }

     */

    @GetMapping("/messages/{chatId}")
    public ResponseEntity<List<ChatMessage>> getMessagesByChatRoomId(@PathVariable String chatId){
        List<ChatMessage> messages = chatMessageService.getChatMessagesByChatId(chatId);
        return ResponseEntity.ok(messages);
        //return ResponseEntity.ok("message "+ chatMessageService.getChatMessagesByChatId(chatId));
        //return chatMessageService.getChatMessagesByChatId(chatId);
    }

}
