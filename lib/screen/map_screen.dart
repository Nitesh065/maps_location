import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng> _latLngList = [
    LatLng(24.551136837964137, 80.96455886663806),
    LatLng(24.57410512559674, 80.83764253964847),
    LatLng(24.561253019852824, 80.90929089916312),
  ];

  List<Marker> _markers = [];

  @override
  void initState() {
    _markers = _latLngList
        .map((point) =>
        Marker(
            point: point,
            width: 80,
            height: 80,
            builder: (context) => Icon(Icons.pin_drop,size: 60.0,)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: MapOptions(
            center:_latLngList[0],
            bounds: LatLngBounds.fromPoints(_latLngList),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              attributionBuilder: (_) {
                return Text("© OpenStreetMap contributors");
              },
            ),
            MarkerLayerOptions(
                markers:_markers
            ),
          ]),);
  }
}
