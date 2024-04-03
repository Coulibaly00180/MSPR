package com.mspr.back.entities;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatNotification {
    private Long id;
    private Long senderId;
    private Long recipientId;
    private String content;

}
