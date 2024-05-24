package com.mspr.back.repositories;

import com.mspr.back.entities.Statut;
import com.mspr.back.entities.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
   User findByEmail(String email);
   Optional<User> findById(Integer id);

   User findByEmailAndPassword(String email, String password);
   //Utiliser un optional pour bonne pratique

   //Utiliser un optional pour bonne pratique
   User findUtilisateurById(Long id);

   List<User> findAllByStatut(Statut statut);
}
