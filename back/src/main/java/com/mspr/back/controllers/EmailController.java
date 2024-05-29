package com.mspr.back.controllers;

import com.mspr.back.dto.MailData;
import com.mspr.back.services.EmailService;
import jakarta.mail.MessagingException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@Slf4j
@RestController
@RequestMapping("/email")
public class EmailController {

   private final EmailService emailService;

   @Autowired
   public EmailController(EmailService emailService) {
      this.emailService = emailService;
   }

   @PostMapping("/send")
   public String send(@RequestBody MailData mailData) throws MessagingException, IOException {
      emailService.sendEmail(
            mailData.toName(),
            mailData.toEmail(),
            mailData.fromName(),
            mailData.fromEmail(),
            mailData.subject(),
            mailData.content()
      );

      return "Email sent successfully!";
   }
}
