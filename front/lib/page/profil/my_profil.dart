import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/css.dart';
import '../../constant/users.dart';

User user = User(
  id: '1',
  pseudo: 'user',
  password: '1234',
  nom: 'Doe',
  prenom: 'John',
  email: 'john.doe@gmail.com',
  adresse: '123 Rue du Général 444000 Nantes',
  user_photo:'',
);


class MyProfilPage extends StatelessWidget {
  const MyProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color cardColor = Colors.white;
    TextStyle titleTextStyle = const TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle contentTextStyle = const TextStyle(color: Colors.black);
    BorderSide cardBorderSide = BorderSide(color: Colors.grey.shade700);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Profil"),
        backgroundColor: greenBar,
      ),
      body: Stack(
        children: [
          // Background image with opacity
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/plante-piece.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildCard(
                  title: "Mes Informations personnelles",
                  contents: ["Nom", "Prénom", "Adresse"],
                  cardColor: cardColor,
                  titleTextStyle: titleTextStyle,
                  contentTextStyle: contentTextStyle,
                  cardBorderSide: cardBorderSide,
                ),
                SizedBox(height: 16),
                _buildCard(
                  title: "Mes Annonces",
                  contents: ["Annonce 1", "Annonce 2","Annonce 3"],
                  cardColor: cardColor,
                  titleTextStyle: titleTextStyle,
                  contentTextStyle: contentTextStyle,
                  cardBorderSide: cardBorderSide,
                ),
                SizedBox(height: 16),
                _buildCard(
                  title: "Mes Prochains ARosa-Je",
                  contents: ["Annonce 1", "Annonce 2"],
                  cardColor: cardColor,
                  titleTextStyle: titleTextStyle,
                  contentTextStyle: contentTextStyle,
                  cardBorderSide: cardBorderSide,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required List<String> contents,
    required Color cardColor,
    required TextStyle titleTextStyle,
    required TextStyle contentTextStyle,
    required BorderSide cardBorderSide,
  }) {
    return Card(
      color: cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: greenBar),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text(title, style: titleTextStyle.copyWith(color: greenBar))),
            for (var content in contents) Text(content, style: contentTextStyle),
          ],
        ),
      ),
    );
  }
}
