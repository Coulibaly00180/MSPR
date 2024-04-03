package com.mspr.back.services;

import com.mspr.back.entities.ChatRoom;
import com.mspr.back.repositories.ChatRoomRepository;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
@Data
@Service
@RequiredArgsConstructor
public class ChatRoomService {

    @Autowired
    private final ChatRoomRepository chatRoomRepository;
    public Optional<Long> getChatRoomId(Long senderId, Long recipientId, boolean createNewRoomIfNotExists){
        return chatRoomRepository.findBySenderIdAndRecipientId(senderId, recipientId)
                .map(ChatRoom::getChatId)
                .or(()-> {
                    if (createNewRoomIfNotExists){
                        var chatId = createChatId(senderId, recipientId);
                        return Optional.of(Long.valueOf(chatId));
                    }
                    return Optional.empty();
                });
    }

    private String createChatId(Long senderId, Long recipientId) {
        var chatId = String.format("%s_%s", senderId, recipientId);

        ChatRoom senderRecipient = ChatRoom.builder()
                .chatId(Long.valueOf(chatId))
                .senderId(senderId)
                .recipientId(recipientId)
                .build();

        ChatRoom recipientSender = ChatRoom.builder()
                .chatId(Long.valueOf(chatId))
                .senderId(recipientId)
                .recipientId(senderId)
                .build();

        chatRoomRepository.save(senderRecipient);
        chatRoomRepository.save(recipientSender);

        return chatId;
    }
}
