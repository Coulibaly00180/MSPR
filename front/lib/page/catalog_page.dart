import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue"),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}
