import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/css.dart';
import '../../constant/users.dart';
import '../annonces/mesAnnonces/my_announcements.dart';
import '../annonces/mesGardes/mes_gardes.dart';

User user = User(
  id: '1',
  pseudo: 'user',
  password: '1234',
  nom: 'Doe',
  prenom: 'John',
  email: 'john.doe@gmail.com',
  adresse: '123 Rue du Général 444000 Nantes',
  user_photo: 'assets/images/profile.png',
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
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(user.user_photo),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    print('Modifier mon profil');
                  },
                  child: Text('Modifier mon profil'),
                  style: ElevatedButton.styleFrom(primary: greenBar),
                ),
                SizedBox(height: 16),
                _buildCard(
                  title: "Mes Informations personnelles",
                  contents: [
                    "Nom: ${user.nom}",
                    "Prénom: ${user.prenom}",
                    "Adresse: ${user.adresse}",
                  ],
                  cardColor: cardColor,
                  titleTextStyle: titleTextStyle,
                  contentTextStyle: contentTextStyle,
                  cardBorderSide: cardBorderSide,
                ),
                SizedBox(height: 16),
                _buildCard(
                  title: "Mes Annonces",
                  contents: annonces.map((annonce) => annonce.titre).toList(),
                  cardColor: cardColor,
                  titleTextStyle: titleTextStyle,
                  contentTextStyle: contentTextStyle,
                  cardBorderSide: cardBorderSide,
                  buttonText: 'Voir mes annonces',
                  onButtonPressed: () {
                    // Logique pour voir les annonces
                    print('Voir mes annonces');
                  },
                ),
                SizedBox(height: 16),
                _buildCard(
                  title: "Mes Prochains ARosa-Je",
                  contents: annoncesArosage.map((annonce) => "${annonce.titre}: ${annonce.debut.day}/${annonce.debut.month}/${annonce.debut.year} au ${annonce.fin.day}/${annonce.fin.month}/${annonce.fin.year}").toList(),
                  cardColor: cardColor,
                  titleTextStyle: titleTextStyle,
                  contentTextStyle: contentTextStyle,
                  cardBorderSide: cardBorderSide,
                  buttonText: 'Voir mes gardes',
                  onButtonPressed: () {
                    // Logique pour voir les gardes
                    print('Voir mes gardes');
                  },
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
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    return Card(
      color: cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: cardBorderSide,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text(title, style: titleTextStyle.copyWith(color: greenBar))),
            for (var content in contents) Text(content, style: contentTextStyle),
            if (buttonText != null && onButtonPressed != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  child: Text(buttonText),
                  style: ElevatedButton.styleFrom(primary: greenBar),
                ),
              ),
          ],
        ),
      ),
    );
  }
}