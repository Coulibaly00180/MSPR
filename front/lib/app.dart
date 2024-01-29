import 'package:flutter/material.dart';
import 'package:front/page/add_announcements.dart';
import 'package:front/page/announce_details.dart';
import 'package:front/page/catalog_page.dart';
import 'package:front/page/connection.dart';
import 'package:front/page/home_page.dart';
import 'package:front/page/my_announcements.dart';
import 'package:front/page/my_profil.dart';
import 'package:front/page/search_page.dart';
import 'package:go_router/go_router.dart';


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
          path: 'annonces',
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
          ],
        ),

      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ARosa-je',
      routerConfig: _router,
    );
  }
}