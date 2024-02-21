import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/page/annonces/mesAnnonces/announce_details.dart'; // Ajustez le chemin d'importation



void main() {
  testWidgets('Affiche les détails de la plante et les boutons', (WidgetTester tester) async {
    // Initialisation du widget
    await tester.pumpWidget(MaterialApp(home: PlantDetailsPage()));

    // Vérifier la présence des éléments de texte
    expect(find.text('AGATA'), findsOneWidget);
    expect(find.text('ARos-eur: JohnD'), findsOneWidget);

    // Vérifier la présence de l'image
    expect(find.byType(Image), findsOneWidget);

    // Vérifier la présence des boutons
    expect(find.text('Supprimer mon annonce'), findsOneWidget);
    expect(find.text('Contacter mon ARos-eur'), findsOneWidget);
  });

}
