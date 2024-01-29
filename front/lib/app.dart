import 'package:flutter/material.dart';
import 'package:front/page/add_announcements.dart';
import 'package:front/page/announce_details.dart';
import 'package:front/page/catalog_page.dart';
import 'package:front/page/home_page.dart';
import 'package:front/page/my_announcements.dart';
import 'package:front/page/my_profil.dart';
import 'package:front/page/search_page.dart';
import 'package:go_router/go_router.dart';


final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState state) => SearchPage(),
        ),
        GoRoute(
          path: 'catalog',
          builder: (BuildContext context, GoRouterState state) => CatalogPage(),
        ),
        GoRoute(
          path: 'profil',
          builder: (BuildContext context, GoRouterState state) =>  MyProfilPage(),
        ),
        GoRoute(
          path: 'annonces',
          builder: (BuildContext context, GoRouterState state) =>  MyAdsPage(),
          routes: [
            GoRoute(
              path: 'add',
              builder: (BuildContext context, GoRouterState state) =>  AddAnnouncementPage(),
            ),
            GoRoute(
              path: ':id/details',
              builder: (BuildContext context, GoRouterState state) => PlantDetailsPage(),
            ),
          ],
        ),
        // Other routes can be added here if necessary
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
      theme: ThemeData.light(), // Define your light theme here (if any)
      darkTheme: ThemeData.dark().copyWith( // Here you define the dark theme
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepPurple,
          secondary: Colors.deepPurpleAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white, // Text color
        ),
      ),
      themeMode: ThemeMode.dark,
      routerConfig: _router,
    );
  }
}

