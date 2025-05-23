import 'package:geolocator/geolocator.dart';
import 'package:talker_flutter/talker_flutter.dart';

enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
  unknown,
}

class GeolocationInitResult {
  final LocationService service;
  final LocationPermissionStatus permissionStatus;
  final Position? initialPosition;
  final bool locationServicesEnabled;

  GeolocationInitResult({
    required this.service,
    required this.locationServicesEnabled,
    required this.permissionStatus,
    this.initialPosition,
  });

  bool get canProceedWithLocation =>
      locationServicesEnabled &&
      permissionStatus == LocationPermissionStatus.granted;

  @override
  String toString() {
    return 'GeolocationInitResult(service: $service, locationServicesEnabled: $locationServicesEnabled, permissionStatus: $permissionStatus, initialPosition: $initialPosition)';
  }
}

class LocationService {
  final GeolocatorPlatform _geolocatorPlatform;
  final Talker? _talker;

  LocationService._internal({
    GeolocatorPlatform? geolocatorPlatform,
    Talker? talker,
  }) : _geolocatorPlatform = geolocatorPlatform ?? GeolocatorPlatform.instance,
       _talker = talker;

  static Future<GeolocationInitResult?> init({
    Talker? talker,
    GeolocatorPlatform? geolocatorPlatform,

    bool fetchInitialPosition = true,
    LocationAccuracy initialAccuracy = LocationAccuracy.medium,
    Duration? timeLimit,
  }) async {
    talker?.info('GeolocationService: Initializing...');
    final service = LocationService._internal(
      geolocatorPlatform: geolocatorPlatform,
      talker: talker,
    );
    return null;
    //  bool servicesEnabled = await service.isLocationServiceEnabled();
    // if (!servicesEnabled) {
    //   talker?.warning('GeolocationService: Location services are disabled.');
    //   return GeolocationInitResult(
    //     service: service,
    //     locationServicesEnabled: false,
    //     permissionStatus: LocationPermissionStatus.serviceDisabled,
    //     initialPosition: null,
    //   );
    // }
  }
}
