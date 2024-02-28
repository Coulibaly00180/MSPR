import 'package:flutter/material.dart';

import ' garde_detail_page.dart';
import '../../../constant/annonces.dart';
import '../../../constant/css.dart';
import '../mesAnnonces/announce_details.dart';

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


class MyGardesPage extends StatelessWidget {
  const MyGardesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes prochains ARosa-je"),
        backgroundColor: greenBar,
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
                  leading: Image.asset(
                    'assets/images/${annonce.url}',
                  ),

                  title: Text(annonce.titre),
                  subtitle: Text('${annonce.debut.day}/${annonce.debut.month}/${annonce.debut.year} au ${annonce.fin.day}/${annonce.fin.month}/${annonce.fin.year}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PlantCarePage()),
                      );
                    },
                    child: const Text('DECLARER UNE VISITE'),
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
    );
  }
}
