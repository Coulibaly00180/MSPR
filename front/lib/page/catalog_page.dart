import 'package:flutter/material.dart';
import 'package:front/constant/css.dart';
import 'package:front/widgets/searchBar/search_bar.dart';
import '../widgets/appbar/bottom_appbar_menu.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPage();
}

class _CatalogPage extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue"),
        backgroundColor: greenBar,
      ),
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchBox(),
            ),
            Text('Résultats de la recherche :'),
            Text('Derniers sujets ajoutés :'),
            // Ajoutez d'autres widgets ici, comme la liste des résultats de recherche
          ],
        ),
      ),
    );
  }
}
