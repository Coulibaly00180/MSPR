import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:mockito/mockito.dart';
import '../lib/page/annonces/mesAnnonces/add_announcements.dart';



void main() {
  testWidgets('Ouvre le dialogue de sélection d\'image', (WidgetTester tester) async {
    // Initialisation du widget
    await tester.pumpWidget(MaterialApp(home: AddAnnouncementPage()));

    // Simuler le tap sur le bouton pour choisir une image
    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pump(); // Reconstruit le widget après l'interaction

    // Vérifiez si le dialogue s'ouvre
    expect(find.text('Veuillez choisir une source'), findsOneWidget);
  });

}
