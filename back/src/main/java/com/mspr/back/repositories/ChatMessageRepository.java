package com.mspr.back.repositories;

import com.mspr.back.entities.ChatMessage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "records", path = "chatMessages")
public interface ChatMessageRepository extends CrudRepository<ChatMessage, Long> {

    List<ChatMessage> findByChatId(String id);

}
