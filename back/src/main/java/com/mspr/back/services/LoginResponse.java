package com.mspr.back.services;

import lombok.*;

@Setter
@Getter
@AllArgsConstructor
public class LoginResponse {
   private String token;

   private long expiresIn;
}
