import 'package:geolocator/geolocator.dart';
import 'package:talker_flutter/talker_flutter.dart';

class LocationService2 {
  // final GeolocatorPlatform _geolocatorPlatform;

  // LocationService2({required GeolocatorPlatform geolocatorPlatform})
  //   : _geolocatorPlatform = geolocatorPlatform;

  static Future<Position?> init({
    bool fetchInitialPosition = true,
    LocationAccuracy initialAccuracy = LocationAccuracy.low,
    required Talker talker,
    Duration timeLimit = const Duration(seconds: 15),
    GeolocatorPlatform? geolocatorPlatform,
  }) async {
    final geolocatorPlatform = GeolocatorPlatform.instance;

    // Check if location services are enabled
    final isLocationServiceEnabled =
        await geolocatorPlatform.isLocationServiceEnabled();
    talker.info('Location services enabled: $isLocationServiceEnabled');
    // Request permission if needed
    LocationPermission permission;
    if (!isLocationServiceEnabled) {
      await geolocatorPlatform.openLocationSettings();
      permission = await geolocatorPlatform.requestPermission();
      talker.info('Location permission status: $permission');
      // if (permission == LocationPermission.denied) {
      //   permission = await geolocatorPlatform.requestPermission();
      // }
      // talker.info('Requested location permission status: $permission');
      // if (permission == LocationPermission.deniedForever) {
      //   talker.error(
      //     'Location permission permanently denied. Cannot request location.',
      //   );
      // }
    } else {
      permission = LocationPermission.deniedForever;
    }

    Position? initialPosition;
    if (fetchInitialPosition &&
        isLocationServiceEnabled &&
        permission == LocationPermission.whileInUse) {
      try {
        initialPosition = await geolocatorPlatform.getCurrentPosition();
        talker.info('Initial position fetched: $initialPosition');
        return initialPosition;
      } catch (e) {
        talker.error('Failed to fetch initial position: $e');
        // Handle exceptions, e.g., timeout or no position available
      }
    }

    return initialPosition;
  }
}
