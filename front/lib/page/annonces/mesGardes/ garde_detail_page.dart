import 'package:flutter/material.dart';

import '../../../constant/annonces.dart';
import '../../../constant/css.dart';

final List<Annonces> annonces = [
  Annonces(
    id: '1',
    titre: 'MARTA',
    debut: DateTime(2024, 6, 15),
    fin: DateTime(2024, 6, 30),
    aroseur_id: '1',
    proprio_id: '1',
    url: 'garde1.jpg',
  ),
  Annonces(
    id: '2',
    titre: 'SPIKE',
    debut: DateTime(2024, 7, 1),
    fin: DateTime(2024, 7, 15),
    aroseur_id: '2',
    proprio_id: '2',
    url: 'garde2.jpg',
  ),
  Annonces(
    id: '3',
    titre: 'ANNA',
    debut: DateTime(2024, 7, 20),
    fin: DateTime(2024, 8, 5),
    aroseur_id: '3',
    proprio_id: '3',
    url: 'garde3.jpg',
  ),
];

class PlantCarePage extends StatelessWidget {
  final String annonceId;

  const PlantCarePage({Key? key, required this.annonceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Annonces annonce = annonces.firstWhere((element) => element.id == annonceId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Déclarer mes visites'),
        backgroundColor: greenBar,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/feuilles.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  margin: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/${annonce.url}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          flex: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                annonce.titre,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Catégorie : Monstera',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Types: Intérieur',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.wb_sunny),
                                  Icon(Icons.water_drop),
                                  Icon(Icons.thermostat),
                                ],
                              ),
                              SizedBox(height: 16),
                              ElevatedButton.icon(
                                icon: Icon(Icons.camera_alt),
                                label: Text('DÉPOSER UNE PHOTO'),
                                onPressed: () {
                                  // Implement photo upload logic
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  onPrimary: Colors.white,
                                  minimumSize: Size(double.infinity, 36),
                                ),
                              ),
                              SizedBox(height: 8),
                              TextButton.icon(
                                icon: Icon(Icons.check, color: Colors.green),
                                label: Text('Valider', style: TextStyle(color: Colors.green)),
                                onPressed: () {
                                  // Implement validation logic
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacement en bas
            ],
          ),
        ),
      ),
    );
  }
}




