import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String lat = '';
String lng = '';

Future<LatLng?> getCoordinatesFromAddress(String address) async {
  try {
    List<Location> locations = await geocoding.locationFromAddress(address);
    if (locations.isNotEmpty) {
      Location location = locations.first; //get first and closest location
      return LatLng(location.latitude, location.longitude);
    }
  } catch (e) {
    debugPrint('Error: $e');
  }
  return null;
}