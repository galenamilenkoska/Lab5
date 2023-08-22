import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Import from latlong2 package

class MapScreen extends StatelessWidget {
  static const routeName = '/map';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(40.7128, -74.0060), // Example location (New York City)
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          // You can add markers, polygons, etc. here as needed
        ],
      ),
    );
  }
}
