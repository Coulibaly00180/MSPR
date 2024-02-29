import 'package:flutter/material.dart';

import '../../../constant/annonces.dart';
import '../../../constant/css.dart';
import 'add_announcements.dart';
import 'announce_details.dart';

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

class MyAdsPage extends StatelessWidget {
  const MyAdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Annonces'),
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
          ListView.builder(
            itemCount: annonces.length,
            itemBuilder: (context, index) {
              final annonce = annonces[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: Image.asset('assets/images/${annonce.url}'),
                  title: Text(annonce.titre),
                  subtitle: Text('${annonce.debut.day}/${annonce.debut.month}/${annonce.debut.year} au ${annonce.fin.day}/${annonce.fin.month}/${annonce.fin.year}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlantDetailsPage(annonceId: annonce.id)),
                      );
                    },
                    child: const Text('DETAILS'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddAnnouncementPage()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Ajouter une Annonce'),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


