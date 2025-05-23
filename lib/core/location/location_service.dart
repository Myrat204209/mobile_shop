import 'package:geolocator/geolocator.dart';
import 'package:talker_flutter/talker_flutter.dart';

enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
  unknown,
}

class LocationService {
  final GeolocatorPlatform _geolocatorPlatform;
  final Talker? _talker;

  LocationService._internal({
    GeolocatorPlatform? geolocatorPlatform,
    Talker? talker,
  }) : _geolocatorPlatform = geolocatorPlatform ?? GeolocatorPlatform.instance,
       _talker = talker;
}
