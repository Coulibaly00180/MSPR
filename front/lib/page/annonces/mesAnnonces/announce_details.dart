import 'package:flutter/material.dart';

import '../../../constant/annonces.dart';
import '../../../constant/css.dart';
import '../../../constant/users.dart';


final List<Annonces> annonces = [
  Annonces(
    id: '1',
    titre: 'CARLA',
    debut: DateTime(2024, 4, 2),
    fin: DateTime(2024, 4, 15),
    aroseur_id: '1',
    proprio_id: '1',
    url: 'annonce1.jpg',
  ),
  Annonces(
    id: '2',
    titre: 'TEO',
    debut: DateTime(2024, 2, 27),
    fin: DateTime(2024, 3, 10),
    aroseur_id: '2',
    proprio_id: '2',
    url: 'annonce2.jpg',
  )
];

User user = User(
  id: '2',
  pseudo: 'user2',
  password: '1234',
  nom: 'Matin',
  prenom: 'Martin',
  email: 'martin.matin@gmail.com',
  adresse: '2 Avenue de la Paix 444000 Nantes',
  user_photo: '',
);

class PlantDetailsPage extends StatelessWidget {
  final String annonceId;

  const PlantDetailsPage({Key? key, required this.annonceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Annonces annonce = annonces.firstWhere((element) => element.id == annonceId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de ma plante'),
        backgroundColor: greenBar,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/feuilles.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              child: Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/${annonce.url}',
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        annonce.titre,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ARos-eur: ${user.pseudo}\nTaille: 45cm\nSon Nom: ${annonce.titre}: Intérieur\nCe qu\'elle aime:',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          // TODO Implement contact functionality
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400,
                          onPrimary: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Contacter mon ARos-eur'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          //TODO Implement delete functionality
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red.shade400,
                          onPrimary: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Supprimer mon annonce'),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
