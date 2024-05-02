package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@Entity
public class User implements UserDetails {
   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
   @Column(nullable = false)
   private Integer id;

   @Column(nullable = false)
   private String fullName;

   @Column(unique = true, length = 100, nullable = false)
   private String email;

   @Column(nullable = false)
   private String password;

   public User(String fullName, String email, String password) {
      this.fullName = fullName;
      this.email = email;
      this.password = password;
   }


   /*@CreationTimestamp
   @Column(updatable = false, name = "created_at")
   private Date createdAt;

   @UpdateTimestamp
   @Column(name = "updated_at")
   private Date updatedAt;

    */

   @Override
   public Collection<? extends GrantedAuthority> getAuthorities() {
      return List.of();
   }

   @Override
   public String getUsername() {
      return email;
   }

   @Override
   public boolean isAccountNonExpired() {
      return true;
   }

   @Override
   public boolean isAccountNonLocked() {
      return true;
   }

   @Override
   public boolean isCredentialsNonExpired() {
      return true;
   }

   @Override
   public boolean isEnabled() {
      return true;
   }

}