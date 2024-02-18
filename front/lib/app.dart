import 'package:flutter/material.dart';
import 'package:front/page/add_announcements.dart';
import 'package:front/page/announce_details.dart';
import 'package:front/page/announcement_menu.dart';
import 'package:front/page/catalog_page.dart';
import 'package:front/page/connection.dart';
import 'package:front/page/home_page.dart';
import 'package:front/page/mes_gardes.dart';
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
                  path: 'mesGardes',
                  builder: (BuildContext context, GoRouterState state) =>  const MyGardesPage(),
                ),
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  SetCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //routerConfig: _router,
        home: Scaffold(
            appBar: AppBar(
              title: Text("ARosa-Je"),
            ),
            body: [
              const HomePage(),
              SearchPage(),
              const AnnouncementPageMenu(),
              const MyProfilPage()
            ][_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.black,
                selectedItemColor: greenBar,
                elevation: 10,
                currentIndex: _currentIndex,
                onTap: (index) => SetCurrentIndex(index),
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
                ])
        )
    );
  }
}
