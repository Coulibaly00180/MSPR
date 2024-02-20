import 'package:flutter/material.dart';
import 'package:front/page/annonces/announcement_menu.dart';
import 'package:front/page/home/home_page.dart';
import 'package:front/page/profil/my_profil.dart';
import 'package:front/page/search/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'constant/css.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    NavigationUltime(),
    SearchPage(),
    AnnouncementPageMenu(), // Assurez-vous que c'est le widget correct pour "Mes Annonces"
    MyProfilPage(),
  ];

  void setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Scaffold(
        body: _pages[_currentIndex], // Affiche la page en fonction de l'index actuel
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: greenBar,
          elevation: 10,
          currentIndex: _currentIndex,
          onTap: setCurrentIndex, // Met à jour l'index lorsqu'un onglet est tapé
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Recherche',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.pagelines),
              label: 'Mes Annonces',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
      )
    );
  }
}
