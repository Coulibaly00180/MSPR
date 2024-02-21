import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/page/annonces/mesAnnonces/my_announcements.dart'; // Ajustez le chemin d'importation

void main() {
  testWidgets('Affiche la liste des annonces et les boutons', (WidgetTester tester) async {
    // Initialisation du widget
    await tester.pumpWidget(MaterialApp(home: MyAdsPage()));

    // Vérifiez la présence des éléments de la liste
    expect(find.text('NOM DE MA PLANTE'), findsNWidgets(3));
    expect(find.byType(Card), findsNWidgets(3));

    // Vérifiez la présence du bouton d'ajout d'annonce
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Ajouter une Annonce'), findsOneWidget);
  });

  testWidgets('Navigue vers les détails de l\'annonce lors du tap sur DETAILS', (WidgetTester tester) async {
    // Initialisation du widget
    await tester.pumpWidget(MaterialApp(home: MyAdsPage()));

    // Simuler le tap sur le bouton DETAILS
    await tester.tap(find.text('DETAILS').first);
    await tester.pumpAndSettle(); // Attendre la fin de l'animation de navigation

  });
}

