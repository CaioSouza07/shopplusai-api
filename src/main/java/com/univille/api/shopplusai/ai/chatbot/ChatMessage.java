package com.univille.api.shopplusai.ai.chatbot;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "chat_message")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class ChatMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String conversationId;

    @Enumerated(EnumType.STRING)
    private MessageRole role;

    @Column(nullable = false)
    private String content;

    private LocalDateTime createdAt;
}
