import 'package:flutter/material.dart';

class PlantDetailsPage extends StatelessWidget {
  const PlantDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Détails de ma plante'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.network(
                'https://via.placeholder.com/150',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                'AGATA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'ARosa-jeur: JohnD\nTaille: 45cm\nSon Nom: Nom\nType: Intérieur\nCe qu\'elle aime:',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO Implement delete functionality
                },
                child: const Text('Supprimer mon annonce'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // TODO Implement contact functionality
                },
                child: const Text('Contacter mon ARosa-jeur'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
