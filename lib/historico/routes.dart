import 'package:flutter/material.dart';
import 'package:astolphus/historico/historico.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final String idPet;
  final String data;

  MapScreen({required this.idPet, required this.data});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  List<LatLng> routeCoordinates = [];

  @override
  void initState() {
    super.initState();
    _fetchAndDisplayRoute();
  }

  Future<void> _fetchAndDisplayRoute() async {
    try {
      List data = await fetchHistorico(widget.idPet, widget.data);
      setState(() {
        routeCoordinates = data.map((item) => LatLng(
          double.parse(item['latitude']),
          double.parse(item['longitude']),
        )).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rota do Pet'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(-23.499954, -47.398504), // Posição inicial do mapa
          zoom: 12,
        ),
        polylines: {
          if (routeCoordinates.isNotEmpty)
            Polyline(
              polylineId: PolylineId('route'),
              points: routeCoordinates,
              color: Colors.blue,
              width: 5,
            ),
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}

