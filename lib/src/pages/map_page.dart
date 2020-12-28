import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/src/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();

  

  @override
  Widget build(BuildContext context) {
    
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    final CameraPosition initialPoint = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 50
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
