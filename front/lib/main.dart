import 'package:flutter/material.dart';
import 'app.dart';
import 'constant/annonces.dart';
import 'constant/users.dart';

void main() {
  runApp(MyApp());

  var user1 = User(
    id: '1',
    pseudo: 'user',
    password: '1234',
    nom: 'Doe',
    prenom: 'John',
    email: 'john.doe@gmail.com',
    adresse: '123 Rue du Général 444000 Nantes',
    user_photo:'',
  );

  var user2 = User(
    id: '2',
    pseudo: 'user2',
    password: '1234',
    nom: 'Matin',
    prenom: 'Martin',
    email: 'martin.matin@gmail.com',
    adresse: '2 Avenue de la Paix 444000 Nantes',
    user_photo: '',
  );

  var annonce = Annonces(
      id: '1',
      titre: 'MARTA',
      debut:  DateTime.utc(2024,04,12),
      fin: DateTime.utc(2024,04,15),
      aroseur_id: '2',
      proprio_id: '1',
      url: 'assets/images/plante-interieur.jpg'
  );

  var annonce2 = Annonces(
      id: '2',
      titre: 'SPIKE',
      debut:  DateTime.utc(2024,05,11),
      fin: DateTime.utc(2024,05,16),
      aroseur_id: '1',
      proprio_id: '2',
      url: 'assets/images/paint.jpg'
  );
}