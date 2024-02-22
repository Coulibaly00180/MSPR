import 'package:flutter/material.dart';

import ' garde_detail_page.dart';
import '../../../constant/css.dart';
import '../mesAnnonces/announce_details.dart';

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
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: Image.asset('assets/images/green-2567165_1280.jpg'),
                  title: const Text('MARTA'),
                  subtitle: const Text('15/06/24 au 30/06/24'),
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
