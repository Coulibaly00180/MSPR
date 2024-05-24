package com.mspr.back.services;


import com.mspr.back.entities.ChatMessage;
import com.mspr.back.repositories.ChatMessageRepository;
import com.mspr.back.repositories.ChatRoomRepository;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Data
@Service
@RequiredArgsConstructor
public class ChatMessageService {

    @Autowired
    private final ChatMessageRepository chatMessageRepository;

    @Autowired
    private final ChatRoomRepository chatRoomRepository;

    @Autowired
    private ChatRoomService chatRoomService;

       /*
    public ChatMessage save(ChatMessage chatMessage){
        var chatId = chatRoomService.getChatRoomId(chatMessage.getSender().getId(), chatMessage.getRecipient().getId(), true)
                .orElseThrow();
        chatMessage.setChatId(chatId);
        chatMessageRepository.save(chatMessage);
        return chatMessage;
    }


    public List<ChatMessage> findChatMessage(Long senderId, Long recepientId) {
        var chatId = chatRoomService.getChatRoomId(senderId, recepientId,false);
        return chatId.map(chatMessageRepository::findByChatId).orElse(new ArrayList<>());
    }

     */

    public List<ChatMessage> getChatMessagesByChatId(String chatId){
        return chatMessageRepository.findByChatId(chatId);
    }

}
