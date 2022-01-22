import 'dart:developer';
import 'package:geolocator/geolocator.dart';

class GetLocation {
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        longitude = position.longitude;
        latitude = position.latitude;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
