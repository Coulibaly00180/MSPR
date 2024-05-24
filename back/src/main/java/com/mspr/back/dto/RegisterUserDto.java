package com.mspr.back.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegisterUserDto {
   private String nom;
   private String prenom;
   private String adresse;
   private String email;
   private String password;
}
