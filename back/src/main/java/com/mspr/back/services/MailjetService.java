package com.mspr.back.services;

import com.mailjet.client.MailjetClient;
import com.mailjet.client.MailjetRequest;
import com.mailjet.client.MailjetResponse;
import com.mailjet.client.resource.Emailv31;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class MailjetService {

   private final String apiKey;
   private final String apiSecret;

   public MailjetService(@Value("${mailjet.api.key}") String apiKey,
                         @Value("${mailjet.api.secret}") String apiSecret) {
      this.apiKey = apiKey;
      this.apiSecret = apiSecret;
   }

   public void sendEmail(String fromEmail, String fromName, String toEmail, String toName, String subject, String textPart, String htmlPart) {
      MailjetClient client = new MailjetClient(apiKey, apiSecret);
      MailjetRequest request = new MailjetRequest(Emailv31.resource)
            .property(Emailv31.MESSAGES, new JSONArray()
                  .put(new JSONObject()
                        .put(Emailv31.Message.FROM, new JSONObject()
                              .put("Email", fromEmail)
                              .put("Name", fromName))
                        .put(Emailv31.Message.TO, new JSONArray()
                              .put(new JSONObject()
                                    .put("Email", toEmail)
                                    .put("Name", toName)))
                        .put(Emailv31.Message.SUBJECT, subject)
                        .put(Emailv31.Message.TEXTPART, textPart)
                        .put(Emailv31.Message.HTMLPART, htmlPart)
                        .put(Emailv31.Message.CUSTOMID, "AppGettingStartedTest")));

      try {
         MailjetResponse response = client.post(request);
         System.out.println(response.getStatus());
         System.out.println(response.getData());
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}
