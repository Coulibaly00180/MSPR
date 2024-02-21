import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/page/profil/my_profil.dart'; // Ajustez le chemin d'importation vers l'emplacement de votre widget MyProfilPage


void main() {
  testWidgets('MyProfilPage a le titre AppBar correct', (WidgetTester tester) async {
    // Construisez notre application et déclenchez un frame.
    await tester.pumpWidget(MaterialApp(home: MyProfilPage()));

    // Vérifiez que le titre de l'AppBar est correct.
    expect(find.text('Mon Profil'), findsOneWidget);
  });

  testWidgets('MyProfilPage a une image de fond avec l\'opacité correcte', (WidgetTester tester) async {
    // Construisez et activez le widget
    await tester.pumpWidget(MaterialApp(home: MyProfilPage()));

    // Trouvez le widget Opacity et vérifiez sa valeur d'opacité
    final opacityWidget = tester.widget<Opacity>(find.byType(Opacity));
    expect(opacityWidget.opacity, 0.5);
  });

  testWidgets('MyProfilPage affiche correctement les cartes', (WidgetTester tester) async {
    // Construisez et activez le widget
    await tester.pumpWidget(MaterialApp(home: MyProfilPage()));

    // Vérifiez si le bon nombre de cartes est rendu
    expect(find.byType(Card), findsNWidgets(3));
  });
}
