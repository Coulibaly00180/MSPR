import '../widgets/appbar/bottom_appbar_menu.dart';
import 'package:flutter/material.dart';

class AddAnnouncementPage extends StatelessWidget {
  const AddAnnouncementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Déposer une annonce'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Text('Mon annonce', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Photo de ma plante',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Nom de ma plante'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Date de début de garde'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Date de fin de garde'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Rechercher ma plante dans le catalogue',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                        },
                        child: const Text('Ajouter mon annonce'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
