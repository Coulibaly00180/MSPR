package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Set;

@Data
@Entity
@Table(name = "Utilisateur")
public class Utilisateur implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "pseudo_utilisateur", nullable = false, unique = true)
    private String pseudo;

    @Column(name = "password_utilisateur", nullable = false)
    private String password;

    @Column(name = "email_utilisateur", unique = true)
    private String email;

    @Column(name = "nom_utilisateur", nullable = false)
    private String nom;

    @Column(name = "prenom_utilisateur", nullable = false)
    private String prenom;


    @Column(name = "adresse_utilisateur", nullable = false)
    private String adresse;

    /*
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "repondre",
            joinColumns = @JoinColumn(name = "id_utilisateur", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "id_annonce", referencedColumnName = "id")
    )
     */

    //private Set<Annonce> annonces_repondues;

    //@OneToMany(mappedBy = "utilisateur_publiant")
    //private Set<Annonce> annonces_publiees;

    //@OneToMany(mappedBy = "utilisateur")
    //private Set <Commentaire> commentaires;

    // IMPLEMENTATION DE LA SECURITE

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getUsername() {
        return this.email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return false;
    }

    @Override
    public boolean isAccountNonLocked() {
        return false;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return false;
    }

    @Override
    public boolean isEnabled() {
        return false;
    }


}
