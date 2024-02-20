import 'package:flutter/material.dart';

import '../../../constant/css.dart';

class MyGardesPage extends StatelessWidget {
  const MyGardesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes prochains ARosa-je"),
        backgroundColor: greenBar,
      ),
      body: Opacity(
        opacity:0.5,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/gardeBck.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: Image.asset(
                    'plante-interieur.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: const Text('NOM DE LA PLANTE A GARDER'),
                  subtitle: const Text('15/06/24 au 30/06/24'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Déclarer une visite'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade400,
                      onPrimary: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
