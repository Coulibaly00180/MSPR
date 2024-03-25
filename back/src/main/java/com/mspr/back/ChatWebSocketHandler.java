package com.mspr.back;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@CrossOrigin
public class ChatWebSocketHandler extends TextWebSocketHandler {
    // Utiliser une Map pour associer un identifiant de session à la session WebSocket elle-même
    private final Map<String, WebSocketSession> sessions = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // Ajouter la nouvelle session à la Map lorsque la connexion est établie
        sessions.put(session.getId(), session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // Envoyer le message reçu à tous les utilisateurs connectés, sauf à l'expéditeur
        for (WebSocketSession webSocketSession : sessions.values()) {
            if (!session.getId().equals(webSocketSession.getId())) {
                webSocketSession.sendMessage(message);
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // Supprimer la session de la Map lorsque la connexion est fermée
        sessions.remove(session.getId());
    }
}

