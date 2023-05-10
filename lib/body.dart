import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mapbox_gl/mapbox_gl.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isFullScreen = false;

  void _toggleFullScreen() {
    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Symbol> blueMarker = [];
    final List<Symbol> redMarker = [];
    const center = LatLng(31.535922300202387, 74.3038406883341);
    MapboxMapController c;
    const _accessToken =
        'pk.eyJ1Ijoic2FsbWFuMTEyMjE1IiwiYSI6ImNsNWtvNHJ3ZjBjMXEzY21waXkyaWx0cXcifQ.wlb1Y-25-WYT9ecU9EOmRQ';
    return Stack(
      children: [
        MapboxMap(
          onMapCreated: (controller) async {
            controller.setSymbolIconAllowOverlap(true);
            controller.setSymbolTextAllowOverlap(true);
            controller
                .addSymbol(getRedMarker(31.5362230, 74.3039406, 'Samnabad'));
            controller.addSymbol(getBlueMarker(31.5962230, 74.3939406, 'UET'));

            controller.onSymbolTapped.add((symbol) {
              animateCameraTo(controller, symbol.options.geometry!);
            });
          },
          initialCameraPosition: const CameraPosition(target: center, zoom: 14),
          accessToken: _accessToken,
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: _toggleFullScreen, child: const Text('HI'))
          ],
        ),
      ],
    );
  }
}

SymbolOptions getRedMarker(double lat, double lon, String? name) =>
    SymbolOptions(
      geometry: LatLng(lat, lon),
      iconSize: .25,
      iconAnchor: 'bottom',
      iconImage: 'assets/icon/red_marker.png',
      textField: name,
      textOffset: const Offset(0, 1),
    );

SymbolOptions getBlueMarker(double lat, double lon, String? name) =>
    SymbolOptions(
      geometry: LatLng(lat, lon),
      iconSize: .25,
      iconAnchor: 'bottom',
      iconImage: 'assets/icon/blue_marker.png',
      textField: name,
      textOffset: const Offset(0, 1),
    );

animateCameraTo(MapboxMapController controller, LatLng pos) {
  controller.animateCamera(
    CameraUpdate.newCameraPosition(
      CameraPosition(target: pos, zoom: 14),
    ),
  );
}
