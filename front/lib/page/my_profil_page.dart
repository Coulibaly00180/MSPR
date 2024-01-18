import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar/bottom_appbar_menu.dart';

class MyProfilPage extends StatelessWidget {
  const MyProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Profil"),
      ),
      body: Column(
        children: [
          Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color:
                Theme.of(context).colorScheme.outline),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text("Mes Informations personelles", style: TextStyle(fontWeight: FontWeight.bold),)),
                    Text("Nom"),
                    Text("Prénom"),
                    Text("Adresse")
                  ],
                ),
              )),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color:
                Theme.of(context).colorScheme.outline),
            ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text("Mes Annonces", style: TextStyle(fontWeight: FontWeight.bold))),
                    Text("Annonce 1"),
                    Text("Annonce 1"),
                  ],
                ),
              )
          ),
          Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color:
                Theme.of(context).colorScheme.outline),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text("Mes Prochains ARosa-Je", style: TextStyle(fontWeight: FontWeight.bold))),
                    Text("Annonce 1"),
                    Text("Annonce 1"),
                  ],
                ))
          )],
      ),
        bottomNavigationBar: BottomAppBarMenu(),
    );
  }
}
