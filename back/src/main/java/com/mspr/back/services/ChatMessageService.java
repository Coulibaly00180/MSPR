package com.mspr.back.services;


import com.mspr.back.entities.ChatMessage;
import com.mspr.back.repositories.ChatMessageRepository;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Data
@Service
@RequiredArgsConstructor
public class ChatMessageService {

    @Autowired
    private final ChatMessageRepository chatMessageRepository;

    @Autowired
    private final ChatRoomService chatRoomService;

    public ChatMessage save(ChatMessage chatMessage){
        var chatId = chatRoomService.getChatRoomId(chatMessage.getSender().getId(), chatMessage.getRecipient().getId(), true)
                .orElseThrow();
        chatMessage.getChatRoom().setId(Long.valueOf(chatId));
        chatMessageRepository.save(chatMessage);
        return chatMessage;
    }


    public List<ChatMessage> findChatMessage(Long senderId, Long recepientId) {
        var chatId = chatRoomService.getChatRoomId(senderId, recepientId,false);
        return chatId.map(chatMessageRepository::findByChatId).orElse(new ArrayList<>());
    }


}
