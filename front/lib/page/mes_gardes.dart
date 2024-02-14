import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/css.dart';

class MyGardesPage extends StatelessWidget {
  const MyGardesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Gardes"),
        backgroundColor: greenBar,
      ),
    );
  }
}
