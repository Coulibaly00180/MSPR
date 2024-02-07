import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constant/css.dart';

class AnnouncementPageMenu extends StatelessWidget {
  const AnnouncementPageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Plantes'),
        backgroundColor: greenBar,
      ),
      body: Column(
        children: [
          GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 3,
            mainAxisSpacing: 0,
            crossAxisCount: 1,
            children: <Widget>[
              _buildButton(context, "MES ANNONCES", "annonces", true),
              _buildButton(context, "MES AROSA-JE", "arosa-je", false),
            ],
          ),        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, String route, bool isLight) {
    return Card(
      color: isLight ? Colors.white : Colors.green.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => context.go("/$route"),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isLight ? Colors.green.shade400 : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
