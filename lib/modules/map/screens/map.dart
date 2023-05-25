import 'dart:async';
import 'dart:collection';
import 'package:assignment1/modules/map/map_service/location.dart';
import 'package:assignment1/shared/colors.dart';
import 'package:assignment1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/distance_time.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double lng;
  final String info;
  final CameraPosition cameraPositionn;
  const MapScreen(
      {super.key,
      required this.lat,
      required this.lng,
      required this.info,
      required this.cameraPositionn});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  static Position? position;
  var myMarkers = HashSet<Marker>();
  late String title;
  static double latt = 0.0;
  static double lngg = 0.0;
  static late CameraPosition placePosition;
  static double time = 0;
  static double distance = 0.0;
  String distancekm = '';
  String timest = '';
  bool isVisible = false;
  String type = '';
  late PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};

  Future<void> getCurrentPosition() async {
    await Locationn.getLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }
  Future<void> calculateDistanceAndTime() async {
    // Calculate the distance between the two points
    setState(() {
      distance = Geolocator.distanceBetween(
        position!.latitude,
        position!.longitude,
        latt,
        lngg,
      );

      // calculate the estimated travel time between the two points

      distance = distance / 1000; //convert to km
      distancekm = distance.toStringAsFixed(1);

      if (distance > 50) {
        time = distance / 80; // assuming average speed of 80 km/h
        time = time * 60;
        if (time >= 60) {
          time = time / 60;
          type = 'hr';
          timest = time.toStringAsFixed(1);
        } else {
          type = 'min';
          timest = time.toStringAsFixed(0);
        }
      } else if (distance <= 50) {
        time = distance / 30; // assuming average speed of 30km/h
        time = time * 60;
        if (time >= 60) {
          time = time / 60;
          type = 'hr';
          timest = time.toStringAsFixed(1);
        } else {
          type = 'min';
          timest = time.toStringAsFixed(0);
        }
      }
    });
  }
  void updateCameraPosition() {
    double miny = (position!.latitude <= latt)
        ? position!.latitude
        : latt;
    double minx = (position!.longitude <= lngg)
        ? position!.longitude
        : lngg;
    double maxy = (position!.latitude <= latt)
        ? latt
        : position!.latitude;
    double maxx = (position!.longitude <= lngg)
        ? lngg
        : position!.longitude;

    double southWestLatitude = miny;
    double southWestLongitude = minx;

    double northEastLatitude = maxy;
    double northEastLongitude = maxx;
    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(northEastLatitude, northEastLongitude),
          southwest: LatLng(southWestLatitude, southWestLongitude),
        ),100
      ),
    );
// Accommodate the two locations within the
// camera view of the map

  }
  createPolylines(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitude,) async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDHUTv2rvccnUtHlYJy-qqqLi6ZswOCgwg", // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;
  }
  @override
  initState() {
    super.initState();
    getCurrentPosition();
    title = widget.info;
    latt = widget.lat;
    lngg = widget.lng;
    placePosition = widget.cameraPositionn;
  }

  Widget buildMap() {
    createPolylines(position!.latitude, position!.longitude, latt, lngg);
    return GoogleMap(
      markers: myMarkers,
      initialCameraPosition: placePosition,
      polylines: Set<Polyline>.of(polylines.values),
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        mapController= controller;
        setState(() {
          myMarkers.add(Marker(
            markerId: const MarkerId('Me'),
            position: LatLng(position!.latitude, position!.longitude),
            infoWindow: const InfoWindow(
              title: "Me",
            ),
          ));
          myMarkers.add(Marker(
            markerId: const MarkerId('Destination'),
            position: LatLng(latt, lngg),
            infoWindow: InfoWindow(
              title: title,
            ),
          ));
        });
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appBar(
        name: "Location",
        list: [],
        function: (){
          Navigator.of(context).pop();
        }
      ),
      body: position != null
          ? Stack(children: [
              buildMap(),
              isVisible
                  ? DistanceAndTime(
                      time: timest,
                      distance: distancekm,
                      isVisible: isVisible,
                      type: type,
                    )
                  : Container(),
            ])
          : const Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
              ),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50, right: 5),
        child: FloatingActionButton(
          onPressed: () {
            isVisible = true;
            updateCameraPosition();
            calculateDistanceAndTime();
            setState(() {
            });
          },
          backgroundColor: defaultColor,
          child: const Icon(
            Icons.directions,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
