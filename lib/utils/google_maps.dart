import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  final LatLng initialCenter =
      const LatLng(-15.798718546848825, -47.86074744233732);
  double initialZoom = 15.0;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: initialZoom,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        const MarkerLayer(
          markers: [
            Marker(
              point: LatLng(-15.798718546848825, -47.86074744233732),
              width: 80,
              height: 80,
              child: Icon(
                Icons.pets,
                size: 40.0,
                color: Color.fromRGBO(105, 37, 190, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant GoogleMaps oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {});
  }
}
