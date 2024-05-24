package com.mspr.back.dto;

public record MailData(String fromEmail, String fromName, String subject, String textPart, String htmlPart, String toEmail, String toName) {
}
