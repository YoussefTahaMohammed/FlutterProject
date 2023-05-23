import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  static double latt = 0.0;
  static double lngg = 0.0;
  static CameraPosition placePosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(latt, lngg),
    tilt: 0.0,
    zoom: 18,
  );
  void updateCameraPosition() {
    setState(() {
      placePosition = CameraPosition(
        target: LatLng(latt, lngg), // new location
        zoom: 16.0, // new zoom level
      );
    });
  }
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Center(
          child: MaterialButton(
            onPressed: (){},


          ),
        )
      ],
    );

  }
}
