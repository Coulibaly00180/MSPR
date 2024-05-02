package com.mspr.back.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LoginUtilisateurDto {
   private String email;
   private String password;
}
