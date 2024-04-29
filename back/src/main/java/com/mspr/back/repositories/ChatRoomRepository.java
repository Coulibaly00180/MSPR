package com.mspr.back.repositories;

import com.mspr.back.entities.ChatRoom;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.Optional;

@RepositoryRestResource(collectionResourceRel = "records", path = "chatRooms")
public interface ChatRoomRepository extends CrudRepository<ChatRoom, String> {


    Optional<ChatRoom> findBySenderIdAndRecipientId(Long senderId, Long recipientId);

    Optional<ChatRoom> findById(Long id);

}
