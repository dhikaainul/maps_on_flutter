import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  final Set<Marker> _markers = {};
  final LatLng _currentPosition = LatLng(-7.7021079, 112.7271303);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId("-7.7021079, 112.7271303"),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Flutter'),
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _currentPosition,
            zoom: 14.0,
          ),
          markers: _markers,
          onTap: (position) {
            setState(() {
              _markers.add(
                Marker(
                  markerId:
                      MarkerId("${position.latitude}, ${position.longitude}"),
                  icon: BitmapDescriptor.defaultMarker,
                  
                  position: position,
                ),
              );
            });
          }),
    );
  }
}
