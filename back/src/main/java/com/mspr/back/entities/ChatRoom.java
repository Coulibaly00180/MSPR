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
@Table(name = "chat_room")
public class ChatRoom {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String chatId;

    private String nom;

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
