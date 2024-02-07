import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/css.dart';
import '../widgets/appbar/bottom_appbar_menu.dart';

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
        backgroundColor: greenBar,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCard(
              title: "Mes Informations personelles",
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
        side: cardBorderSide,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text(title, style: titleTextStyle)),
            for (var content in contents) Text(content, style: contentTextStyle),
          ],
        ),
      ),
    );
  }
}
