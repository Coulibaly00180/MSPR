import 'package:flutter/material.dart';
import 'package:front/page/annonces/add_announcements.dart';
import 'package:front/page/annonces/announce_details.dart';
import 'package:front/page/annonces/announcement_menu.dart';
import 'package:front/page/catalogue/catalog_page.dart';
import 'package:front/page/connection.dart';
import 'package:front/page/home/home_page.dart';
import 'package:front/page/annonces/mes_gardes.dart';
import 'package:front/page/annonces/my_announcements.dart';
import 'package:front/page/profil/my_profil.dart';
import 'package:front/page/search/search_page.dart';
import 'package:navigator/navigator.dart';

import 'constant/css.dart';

final navigationPaths = [
  NamedPath(
    pathName: '/',
    builder: (BuildContext context, RouteSettings settings) => HomePage(),
  ),
 /* NamedPath(
    pathName: '/home',
    builder: (BuildContext context, RouteSettings settings) => HomePage(),
  ),*/
  NamedPath(
    pathName: '/search',
    builder: (BuildContext context, RouteSettings settings) => SearchPage(),
  ),
  NamedPath(
    pathName: '/catalog',
    builder: (BuildContext context, RouteSettings settings) => const CatalogPage(),
  ),
  NamedPath(
    pathName: '/profil',
    builder: (BuildContext context, RouteSettings settings) => const MyProfilPage(),
  ),
  NamedPath(
    pathName: '/annoncesMenu',
    builder: (BuildContext context, RouteSettings settings) => const AnnouncementPageMenu(),
  ),
  NamedPath(
    pathName: '/annoncesMenu/mesGardes',
    builder: (BuildContext context, RouteSettings settings) => const MyGardesPage(),
  ),
  NamedPath(
    pathName: '/annoncesMenu/mesAnnonces',
    builder: (BuildContext context, RouteSettings settings) => const MyAdsPage(),
  ),
  NamedPath(
    pathName: '/annoncesMenu/mesAnnonces/add',
    builder: (BuildContext context, RouteSettings settings) => const AddAnnouncementPage(),
  ),
  NamedPath(
    pathName: '/annoncesMenu/mesAnnonces/:id/details',
    builder: (BuildContext context, RouteSettings settings) => const PlantDetailsPage(),
  ),
];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

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
        body: Navigator(
          onGenerateRoute: (settings) {
            final path = settings.name;
            for (final route in navigationPaths) {
              if (route.pathName == path) {
                return MaterialPageRoute(
                  builder: (context) => route.builder(context, settings),
                );
              }
            }
            return null;
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: greenBar,
          elevation: 10,
          currentIndex: _currentIndex,
          onTap: setCurrentIndex,
          unselectedItemColor: Colors.grey.shade300,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Recherche',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_outlined),
              label: 'Mes Annonces',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
