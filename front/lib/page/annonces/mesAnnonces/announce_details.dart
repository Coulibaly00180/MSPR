import 'package:flutter/material.dart';

import '../../../constant/css.dart';

class PlantDetailsPage extends StatelessWidget {
  const PlantDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Définissez le rayon de bordure ici
                      border: Border.all(color: Colors.black, width: 2), // Définissez la bordure ici
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Définissez le même rayon de bordure ici
                      child: Image.asset(
                        'assets/images/green-2567165_1280.jpg',
                        width: 150,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'AGATA',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'ARos-eur: JohnD\nTaille: 45cm\nSon Nom: Nom\nType: Intérieur\nCe qu\'elle aime:',
                  style: TextStyle(fontSize: 16,),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      //TODO Implement delete functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('Supprimer mon annonce')
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // TODO Implement contact functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Contacter mon ARos-eur'),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

