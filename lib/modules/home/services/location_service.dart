
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Serviços de localização desativados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        return Future.error('Permissão de localização negada.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permissão de localização negada permanentemente.');
    }

    return await Geolocator.getCurrentPosition();
  }

  static Future<LatLng> getCurrentLatLng() async {
    final position = await _determinePosition();
    return LatLng(position.latitude, position.longitude);
  }

  static Future<Placemark> getCurrentLocation() async {
      final position = await _determinePosition();
      final placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      return placemarks.first;
  }

}
