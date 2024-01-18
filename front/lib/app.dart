import 'package:flutter/material.dart';
import 'package:front/page/home_page.dart';
import 'package:front/page/my_profil_page.dart';
import 'package:front/page/search_page.dart';
import 'package:go_router/go_router.dart';


final _router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (_,__) => HomePage(),
        routes: [
          GoRoute(path: "search", builder: (_,__) => SearchPage()),
          GoRoute(path: "profil", builder: (_,__) => MyProfilPage()),
        ],
      )
    ]);

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
