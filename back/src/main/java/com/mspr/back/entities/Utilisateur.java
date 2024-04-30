package com.mspr.back.entities;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Utilisateur")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Utilisateur implements UserDetails {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "pseudo_utilisateur", nullable = false, unique = true)
    private String pseudo;

    @NotBlank(message = "Le mot de passe est requise")
    @Size(min = 3, message = "Le mot de passe doit avoir 3 caractères minimum")
    @Column(name = "password_utilisateur", nullable = false)
    private String password;

    @Column(name = "email_utilisateur", unique = true)
    @Email(message="Format email invalid")
    @NotBlank(message = "L'email est requise")
    private String email;

    @Column(name = "nom_utilisateur", nullable = false)
    private String nom;

    @Column(name = "prenom_utilisateur", nullable = false)
    private String prenom;


    @Column(name = "adresse_utilisateur", nullable = false)
    private String adresse;

    @Enumerated(EnumType.STRING)
    private Statut statut;


    @ManyToMany
    @JoinTable(name = "accepte",
            joinColumns = @JoinColumn(name = "id_utilisateur", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "id_annonce", referencedColumnName = "id")
    )
    private Set<Annonce> annonces_repondues;

    @OneToMany(mappedBy = "utilisateur")
    private Set<Plante> plantes;

    /*@OneToMany(mappedBy = "utilisateur_publiant")
     *private Set<Annonce> annonces_publiees;
     *
     */

   /* @OneToMany(mappedBy = "expediteur")
    private Set<Message> messages_envoyes;

    @OneToMany(mappedBy = "destinataire")
    private Set<Message> messages_recus;

    */

    @OneToMany(mappedBy = "utilisateur")
    private Set<Reponse> reponses;

    @JsonManagedReference
    @OneToMany(mappedBy = "sender")
    private Set<ChatMessage> messages_envoyes;

    @OneToMany(mappedBy = "recipient")
    private Set<ChatMessage> messages_recus;

    @OneToMany(mappedBy = "sender")
    private List<ChatRoom> senderRooms;

    @OneToMany(mappedBy = "recipient")
    private List<ChatRoom> recipientRooms;



    /*
    public Set<Message> getMessages_envoyes() {
        return messages_envoyes;
    }

    public void setMessages_envoyes(Set<Message> messages_envoyes) {
        this.messages_envoyes = messages_envoyes;
    }

    public Set<Message> getMessages_recus() {
        return messages_recus;
    }

    public void setMessages_recus(Set<Message> messages_recus) {
        this.messages_recus = messages_recus;
    }

     */

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Utilisateur that = (Utilisateur) o;
        return Objects.equals(id, that.id) && Objects.equals(password, that.password) && Objects.equals(email, that.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, password, email);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getUsername() {
        return null;
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