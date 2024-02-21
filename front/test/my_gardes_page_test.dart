import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/page/annonces/mesGardes/mes_gardes.dart'; // Adjust the import path to where your MyGardesPage widget is located


void main() {
  testWidgets('MyGardesPage a le titre AppBar correct', (WidgetTester tester) async {
    // Créez notre application et déclenchez un frame.
    await tester.pumpWidget(MaterialApp(home: MyGardesPage()));

    // Vérifiez que le titre de l'AppBar est correct.
    expect(find.text('Mes prochains ARosa-je'), findsOneWidget);
  });

  testWidgets('Le corps de MyGardesPage a la bonne opacité', (WidgetTester tester) async {
    // Construire et pomper le widget
    await tester.pumpWidget(MaterialApp(home: MyGardesPage()));

    // Recherchez le widget Opacité et vérifiez sa valeur d'opacité
    final opacityWidget = tester.widget<Opacity>(find.byType(Opacity));
    expect(opacityWidget.opacity, 0.5);
  });

  testWidgets('MyGardesPage affiche correctement les éléments de la liste', (WidgetTester tester) async {
    // Construire et pomper le widget
    await tester.pumpWidget(MaterialApp(home: MyGardesPage()));

    //  Check if the correct number of list items are rendered
    expect(find.byType(Card), findsNWidgets(3));
  });
}
