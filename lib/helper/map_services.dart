import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapServices {
  MapServices._();
  static final instance = MapServices._();
  GoogleMapController? mapController;
  String address = "Geser peta untuk memilih lokasi";

  Future<Position> getAddress() async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      throw Exception('Location service disabled');
    }

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }

    if(permission == LocationPermission.deniedForever){
      permission = await Geolocator.requestPermission();
    }

    if(permission == LocationPermission.deniedForever){
      throw Exception('Location permission denied forever');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
  }

  Future<String> getAddressFromLatLng(double lat, double lng,) async {
    final placemarks = await placemarkFromCoordinates(lat, lng);
    if(placemarks.isEmpty) return "Alamat tidak ditemukan";
    final place = placemarks.first;
    return "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}";
  }
}