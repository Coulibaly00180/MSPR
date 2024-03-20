package com.mspr.back.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import java.util.Objects;
import java.util.Set;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Utilisateur")
public class Utilisateur {

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

    @OneToMany(mappedBy = "expediteur")
    private Set<Message> messages_envoyes;

    @OneToMany(mappedBy = "destinataire")
    private Set<Message> messages_recus;

    @OneToMany(mappedBy = "utilisateur")
    private Set<Reponse> reponses;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public Set<Annonce> getAnnonces_repondues() {
        return annonces_repondues;
    }

    public void setAnnonces_repondues(Set<Annonce> annonces_repondues) {
        this.annonces_repondues = annonces_repondues;
    }

    public Set<Plante> getPlantes() {
        return plantes;
    }

    public void setPlantes(Set<Plante> plantes) {
        this.plantes = plantes;
    }

    public Set<Reponse> getReponses() {
        return reponses;
    }

    public void setReponses(Set<Reponse> reponses) {
        this.reponses = reponses;
    }

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
}