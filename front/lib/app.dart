import 'package:flutter/material.dart';
import 'package:front/page/add_announcements.dart';
import 'package:front/page/announce_details.dart';
import 'package:front/page/announcement_menu.dart';
import 'package:front/page/catalog_page.dart';
import 'package:front/page/connection.dart';
import 'package:front/page/home_page.dart';
import 'package:front/page/my_announcements.dart';
import 'package:front/page/my_profil.dart';
import 'package:front/page/search_page.dart';
import 'package:go_router/go_router.dart';

import 'constant/css.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => ConnectionPage(),
      routes: [
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) => HomePage(),
        ),
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState state) => SearchPage(),
        ),
        GoRoute(
          path: 'catalog',
          builder: (BuildContext context, GoRouterState state) => const CatalogPage(),
        ),
        GoRoute(
          path: 'profil',
          builder: (BuildContext context, GoRouterState state) => const MyProfilPage(),
        ),
        GoRoute(
          path: 'annoncesMenu',
          builder: (BuildContext context, GoRouterState state) =>  const AnnouncementPageMenu(),
          routes: [
            GoRoute(
              path: 'mesAnnonces',
              builder: (BuildContext context, GoRouterState state) =>  const MyAdsPage(),
                routes: [
                  GoRoute(
                    path: 'add',
                    builder: (BuildContext context, GoRouterState state) =>  const AddAnnouncementPage(),
                  ),
                  GoRoute(
                    path: ':id/details',
                    builder: (BuildContext context, GoRouterState state) => const PlantDetailsPage(),
                  ),
                ]
            ),
          ]
        )
      ],
    )]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARosa-je',
      //routerConfig: _router,
      home: BottomMenu(),
    );
  }
}

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu>{
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    HomePage(),
    CatalogPage(),
    AnnouncementPageMenu(),
    MyProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ARosa-Je'),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: greenBar,
        unselectedItemColor: Colors.grey.shade300,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Catalogue',
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
