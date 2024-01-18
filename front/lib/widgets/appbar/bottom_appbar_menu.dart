import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomAppBarMenu extends StatefulWidget {
  const BottomAppBarMenu({super.key});

  @override
  State<BottomAppBarMenu> createState() => _BottomAppBarMenuState();
}

class _BottomAppBarMenuState extends State<BottomAppBarMenu> {
  int currentPageIndex = 0;
  final List<String> pageRoutes = [
    '/',
    '/search',
    '/profil',
  ];

  @override
  Widget build(BuildContext context) {
    return
      NavigationBar(
        onDestinationSelected: (int index) {
          final String route = pageRoutes[index];
          context.go(route);
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.green,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
              icon:  Icon(Icons.home_outlined),
              label: 'Home'),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2),
            icon: Icon(Icons.person_2_outlined),
            label: 'Mon Profil',
          ),
        ],
    );
  }
}