import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constant/css.dart';

class AnnouncementPageMenu extends StatelessWidget {
  const AnnouncementPageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children : [
            _buildButton(context, "MES GARDES", "annonces", true),
            _buildButton(context, "MES ANNONCES", "annoncesMenu/mesAnnonces", false)
          ]),
    );
  }

  Widget _buildButton(BuildContext context, String text, String route, bool isLight) {
    return Container(
      width: 200,
      height: 100,
      child: Card(
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
      ),
    );
  }
}
