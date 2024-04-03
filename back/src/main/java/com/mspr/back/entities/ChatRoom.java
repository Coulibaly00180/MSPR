package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class ChatRoom {

    @Id
    private Long id;
    private Long chatId;

    /*

    private Long senderId;

    private Long recipientId;
     */


    @ManyToOne
    @JoinColumn(name = "sender_id")
    private Utilisateur sender;

    @ManyToOne
    @JoinColumn(name = "recipient_id")
    private Utilisateur recipient;

    @OneToMany(mappedBy = "chatRoom")
    private List<ChatMessage> messages;


}
