import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigator/navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/logo.png", width: 150),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 3,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                children: <Widget>[
                  _buildButton(context, "MON PROFIL", FontAwesomeIcons.user, "/profil"),
                  _buildButton(context, "MES ANNONCES", FontAwesomeIcons.pagelines, "/annoncesMenu/mesAnnonces"),
                  _buildButton(context, "MES AROSA-JE", FontAwesomeIcons.droplet, "/arosa-je"),
                  _buildButton(context, "CONSEILS", FontAwesomeIcons.book, "/catalog"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData iconData, String route) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 8), // Espacement entre l'icône et le texte
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
