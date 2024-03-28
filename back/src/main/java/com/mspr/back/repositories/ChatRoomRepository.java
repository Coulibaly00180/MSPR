package com.mspr.back.repositories;

import com.mspr.back.entities.ChatRoom;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface ChatRoomRepository extends CrudRepository<ChatRoom, String> {


    Optional<ChatRoom> findBySenderIdAndRecipientId(Long senderId, Long recipientId);

}
