import 'package:flutter/material.dart';

import '../../../constant/css.dart';

class PlantCarePage extends StatelessWidget {
  const PlantCarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Déclarer mes visites'),
          backgroundColor: greenBar,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                        child: Image.asset(
                          'assets/images/homeImg.png',
                          fit: BoxFit.cover,
                        ),
                        flex: 2, // Adjust flex to control image height
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SPIKE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 8), // For spacing
                            Text('Son Nom: Monstera'),
                            SizedBox(height: 8),
                            Text('Types: Intérieur'),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.wb_sunny),
                                Icon(Icons.water_drop),
                                Icon(Icons.thermostat),
                                // Add more icons as needed
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
                                minimumSize: Size(double.infinity, 36), // Make button wide
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
            SizedBox(height: 20), // For bottom padding
          ],
        ),
    );
  }
}
