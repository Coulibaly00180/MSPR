package com.mspr.back.repositories;

import com.mspr.back.entities.Message;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "records", path = "messages")
public interface MessageRepository extends CrudRepository<Message,Long> {

}

