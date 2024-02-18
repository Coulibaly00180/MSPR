import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 20),
                  child: AnimatedOpacity(
                  opacity: 1, // Commencez avec une opacité de 0 pour l'effet de fondu
                  duration: const Duration(milliseconds: 500), // Définissez la durée de l'animation
                  curve: Curves.easeInOut, // Définissez la courbe de l'animation
                    child: Image.asset(
                    "assets/images/logo.png",
                    width: 150,
                    ),
                ),
              ),
              Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[
                  _buildButton(context, "MON PROFIL", FontAwesomeIcons.user, "profil", true),
                  _buildButton(context, "MES ANNONCES", FontAwesomeIcons.pagelines, "annoncesMenu/annonces", false),
                  _buildButton(context, "MES AROSA-JE", FontAwesomeIcons.droplet, "arosa-je", false),
                  _buildButton(context, "CONSEILS", FontAwesomeIcons.book, "catalog", true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData iconData, String route, bool isLight) {
    return Card(
      color: isLight ? Colors.white : Colors.green.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          // Ajoutez une animation de pulsation lors du tap sur le bouton
          // Utilisez un AnimatedContainer avec la propriété duration pour contrôler la durée de l'animation
          // Utilisez la propriété curve pour définir la courbe de l'animation
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => Container()),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: isLight ? Colors.green.shade400 : Colors.white,
                size: 32,
              ),
              const SizedBox(height: 8), // Espacement entre l'icône et le texte
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isLight ? Colors.green.shade400 : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
