import 'package:geolocator/geolocator.dart';

class Locationn {
  static Future<Position> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.requestPermission();
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permisssion is denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permission denied forever');
    }


    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
  }
}