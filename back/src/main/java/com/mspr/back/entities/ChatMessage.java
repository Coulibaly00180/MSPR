package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class ChatMessage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long chatId;

    /*
    private Long senderId;
    private Long recipientId;
     */

    private String content;
    private Date timestamp;

    @ManyToOne
    @JoinColumn(name = "id_chat")
    private ChatRoom chatRoom;

    @ManyToOne
    @JoinColumn(name = "sender_id")
    private Utilisateur sender;

    @ManyToOne
    @JoinColumn(name = "recipient_id")
    private Utilisateur recipient;



}
