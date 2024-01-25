import 'package:flutter/material.dart';
import 'package:front/page/add_announcements.dart';
import 'package:front/page/home_page.dart';
import 'package:front/page/my_announcements.dart';
import 'package:front/page/my_profil_page.dart';
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
          path: 'profil',
          builder: (BuildContext context, GoRouterState state) =>  MyProfilPage(),
        ),
        GoRoute(
          path: 'annonces',
          builder: (BuildContext context, GoRouterState state) =>  MyAdsPage(),
          routes: [
            GoRoute(
              path: 'add',
              builder: (BuildContext context, GoRouterState state) => const AddAnnouncementPage(),
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
