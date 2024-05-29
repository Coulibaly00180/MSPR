package com.mspr.back.services;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class EmailService {
   private final JavaMailSender javaMailSender;

   public EmailService(JavaMailSender javaMailSender) {
      this.javaMailSender = javaMailSender;
   }


   @Async
   public void sendEmail(String toName, String toEmail, String fromName, String fromEmail, String subject, String content) throws MessagingException, IOException {
      MimeMessage mineMessage = javaMailSender.createMimeMessage();
      mineMessage.setFrom(new InternetAddress(fromEmail));
      mineMessage.setRecipients(MimeMessage.RecipientType.TO, toEmail);
      mineMessage.setSubject(subject);
      String responseLink ="https://www.google.fr/";

      // HTML Template
      String htmlTemplate = readFile("C:\\Users\\ALFRED\\Desktop\\MSPR\\MSPR\\back\\src\\main\\resources\\template.html");
      String htmlContent = htmlTemplate.replace("${toName}", toName)
                                       .replace("${fromName}", fromName)
                                       .replace("${message}", content)
                                       .replace("${responseLink}", responseLink);

      mineMessage.setContent(htmlContent, "text/html; charset=utf-8");

      javaMailSender.send(mineMessage);
   }
   public String readFile(String filePath) throws IOException {
      Path path = Paths.get(filePath);
      return Files.readString(path, StandardCharsets.UTF_8);
   }
}
