package com.mspr.back.services;

import com.mspr.back.repositories.ChatRoomRepository;
import com.mspr.back.repositories.UserRepository;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Data
@Service
@RequiredArgsConstructor
public class ChatRoomService {

    @Autowired
    private final ChatRoomRepository chatRoomRepository;

    @Autowired
    private final UserRepository userRepository;

    /*
    public Optional<String> getChatRoomId(Long senderId, Long recipientId, boolean createNewRoomIfNotExists){
        return chatRoomRepository.findBySenderIdAndRecipientId(senderId, recipientId)
            .map(ChatRoom::getChatId)
            .or(()-> {
                if (createNewRoomIfNotExists){
                    var chatId = createChatId(senderId, recipientId);
                    return Optional.of(chatId);
                }
                return Optional.empty();
            });
    }

     */

    /*
    private String createChatId(Long senderId, Long recipientId) {
        var chatId = String.format("%s_%s", senderId, recipientId);

       ChatRoom senderRecipient = ChatRoom.builder()
                .chatId(chatId)
                .sender(userRepository.findUserById(senderId))
                .recipient(userRepository.findUserById(recipientId))
                .build();

        ChatRoom recipientSender = ChatRoom.builder()
                .chatId(chatId)
                .sender(userRepository.findUserById(recipientId))
                .recipient(userRepository.findUserById(senderId))
                .build();



        chatRoomRepository.save(senderRecipient);
        chatRoomRepository.save(recipientSender);

        return chatId;
    }

        */
}
