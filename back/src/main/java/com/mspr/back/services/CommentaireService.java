package com.mspr.back.services;

import com.mspr.back.entities.Annonce;
import com.mspr.back.entities.Commentaire;
import com.mspr.back.repositories.CommentaireRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@Service
public class CommentaireService {

    @Autowired
    private CommentaireRepository commentaireRepository;

    public Optional<Commentaire> getCommentaire(final Long id) {
        return commentaireRepository.findById(id);
    }

    public Iterable<Commentaire> getCommentaire() {
        return commentaireRepository.findAll();
    }

    public void deleteCommentaire(final Long id) {
        commentaireRepository.deleteById(id);
    }

    public Commentaire saveCommentaire(Commentaire commentaire) {
        Commentaire savedCommentaire = commentaireRepository.save(commentaire);
        return savedCommentaire;
    }
}
