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
      appBar: AppBar(
        title: const Text("Annonces à proximité"),
      ),
      body: Stack(
        children: [
          FlutterMap(
              options: const MapOptions(
                  initialCenter: LatLng(47.2061667, -1.5419617), rotation: 0
              ),
              mapController: mapController,
              children: [
                TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                ),
                const MarkerLayer(
                    markers: [
                      Marker(
                          child: Icon(Icons.accessibility),
                          point: LatLng(47.2061667, -1.5419617)
                      )
                    ]
                ),
              ]
          ),
          Positioned(
            top: 10,
            right: 15,
            left: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBarMenu(),
    );
  }
}
