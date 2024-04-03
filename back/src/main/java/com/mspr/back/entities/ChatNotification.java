package com.mspr.back.entities;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatNotification {
    private Long id;
    // Ou utiliser plutot les senderId et recipientId
    // Si oui, modifier dans le chatController le builder
    // de la methode processMessage
    private Utilisateur sender;
    private Utilisateur recipient;
    private String content;

}
