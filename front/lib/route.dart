import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front/page/annonces/add_announcements.dart';
import 'package:front/page/annonces/announce_details.dart';
import 'package:front/page/annonces/announcement_menu.dart';
import 'package:front/page/annonces/mes_gardes.dart';
import 'package:front/page/annonces/my_announcements.dart';
import 'package:front/page/catalogue/catalog_page.dart';
import 'package:front/page/home/home_page.dart';
import 'package:front/page/profil/my_profil.dart';
import 'package:front/page/search/search_page.dart';
import 'package:navigator/navigator.dart';

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