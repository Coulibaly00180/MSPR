import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/appbar/bottom_appbar_menu.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          FlutterMap(
              options: const MapOptions(
                  initialCenter: LatLng(47.2061667, -1.5419617), rotation: 0),
              mapController: mapController,
              children: [
                TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"),
                const MarkerLayer(
                    markers: [
                      Marker(
                          child: Icon(Icons.accessibility),
                          point: LatLng(47.2061667, -1.5419617))
                    ]),
              ]),
        bottomNavigationBar: BottomAppBarMenu()
    );
  }
}
