import 'package:flutter/material.dart';
import 'package:front/page/profil/my_profil.dart';

class RootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const RootScreen({
    required this.screen,
    super.key,
  });

  final String screen;


  @override
  Widget build(BuildContext context) {
    return MyProfilPage();
    }
}
