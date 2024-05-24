package com.mspr.back.controllers;

import com.mspr.back.dto.MailData;
import com.mspr.back.services.MailjetService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/email")
public class EmailController {

   private final MailjetService mailjetService;

   @Autowired
   public EmailController(MailjetService mailjetService) {
      this.mailjetService = mailjetService;
   }

   @PostMapping("/send")
   //public String sendEmail(@RequestParam String toEmail, @RequestParam String toName) {
   public String sendEmail(@RequestBody MailData mailInfo) {
      String fromEmail = mailInfo.fromEmail();
      String fromName = mailInfo.fromName();
      String subject = mailInfo.subject();
      String textPart = mailInfo.textPart();
      String htmlPart = "<h3>Bonjour</h3>toto</p>";
      String toEmail = mailInfo.toEmail();
      String toName = mailInfo.toName();

      //log.info(toEmail +"==>"+ toName);
      mailjetService.sendEmail(fromEmail, fromName, toEmail, toName, subject, textPart, htmlPart);
      log.info("mail ==> " + mailInfo.fromEmail());
      return "Email sent successfully!";
   }
}
