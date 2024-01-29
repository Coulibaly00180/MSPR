import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/widgets/appbar/bottom_appbar_menu.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        cardColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WELCOME !"),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/images/logo.png", width: 100),
              ),
             const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "“A'rosa-je” aide les particuliers à prendre soin de leurs plantes, en les mettant en relation avec d’autres particuliers pour les garder en cas d’absence.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    _buildButton(context, "FORUM", "forum", true),
                    _buildButton(context, "MES ANNONCES", "annonces", false),
                    _buildButton(context, "MES AROSA-JE", "arosa-je", false),
                    _buildButton(context, "CONSEILS", "conseils", true),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomAppBarMenu(),
      ),
    );
  }
  Widget _buildButton(BuildContext context, String text, String route, bool isLight) {
    return Card(
      color: isLight ? Colors.white : Colors.green.shade400,
      child: InkWell(
        onTap: () => context.go("/$route"),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isLight ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
