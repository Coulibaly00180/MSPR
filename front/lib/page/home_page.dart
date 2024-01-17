import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/widgets/appbar/bottom_appbar_menu.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
          Column(
            children: [
              //Image.asset("assets/images/logo.png"),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(40),
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => context.go("/"),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                        child:
                        const Text(
                            "MON PROFIL",
                            style: TextStyle(color : Colors.white,fontWeight: FontWeight.bold))),
                    ElevatedButton(
                        onPressed: () => context.go("/"),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.teal)),
                        child:
                        const Text(
                            "MES AROSA-JE",
                            style: TextStyle(color : Colors.white,fontWeight: FontWeight.bold))),
                    ElevatedButton(
                        onPressed: () => context.go("/search"),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.teal)),
                        child:
                        const Text(
                            "TROUVER UNE PLANTE",
                            style: TextStyle(color : Colors.white,fontWeight: FontWeight.bold))),
                    ElevatedButton(
                        onPressed: () => context.go("/"),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                        child:
                        const Text(
                            "CONSEILS",
                            style: TextStyle(color : Colors.white, fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ],
          ),
        bottomNavigationBar: BottomAppBarMenu()
    );
  }
}
