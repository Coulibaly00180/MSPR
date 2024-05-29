package com.mspr.back.dto;

public record MailData(String toName, String toEmail, String fromName, String fromEmail, String subject, String content) {
}
