import 'package:flutter/material.dart';

class PlantCarePage extends StatelessWidget {
  const PlantCarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Déclarer mes visites'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
              },
            ),
          ],
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/your-plant-image.png',
                        fit: BoxFit.cover,
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
                            Text('Son Nom: Monstera'),
                            Text('Types: Intérieur'),
                            Row(
                              children: [
                                Icon(Icons.wb_sunny),
                                Icon(Icons.water_drop),
                                Icon(Icons.thermostat),
                                // Add more icons as needed
                              ],
                            ),
                            ElevatedButton.icon(
                              icon: Icon(Icons.camera_alt),
                              label: Text('DÉPOSER UNE PHOTO'),
                              onPressed: () {
                                // Implement  photo upload logic
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onPrimary: Colors.white,
                              ),
                            ),
                            TextButton.icon(
                              icon: Icon(Icons.check, color: Colors.green),
                              label: Text('Valider', style: TextStyle(color: Colors.green)),
                              onPressed: () {
                                // Implement  validation logic
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                child: Text('Contacter un botaniste'),
                onPressed: () {
                  // Implement contact functionality
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Button color
                  onPrimary: Colors.white, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
