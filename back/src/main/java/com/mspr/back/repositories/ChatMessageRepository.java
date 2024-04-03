package com.mspr.back.repositories;

import com.mspr.back.entities.ChatMessage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "records", path = "chatMessage")
public interface ChatMessageRepository extends CrudRepository<ChatMessage,String> {

    List<ChatMessage> findByChatId(Long id);
}
