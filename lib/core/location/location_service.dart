import 'package:geolocator/geolocator.dart';
import 'package:talker_flutter/talker_flutter.dart';

enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
  unknown,
}

class LocationInitResult {
  final LocationService service;
  final LocationPermissionStatus permissionStatus;
  final Position? initialPosition;
  final bool locationServicesEnabled;

  LocationInitResult({
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
    return 'LocationInitResult(service: $service, locationServicesEnabled: $locationServicesEnabled, permissionStatus: $permissionStatus, initialPosition: $initialPosition)';
  }
}

class LocationService {
  final GeolocatorPlatform _geolocatorPlatform;
  final Talker? _talker;

  // Private constructor, as initialization is now preferred via the static method
  LocationService._internal({
    GeolocatorPlatform? geolocatorPlatform,
    Talker? talker,
  }) : _geolocatorPlatform = geolocatorPlatform ?? GeolocatorPlatform.instance,
       _talker = talker;

  /// Initializes the LocationService, checks permissions, and optionally gets the initial position.
  static Future<LocationInitResult> init({
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
    bool servicesEnabled = await service.isLocationServiceEnabled();
    if (!servicesEnabled) {
      talker?.warning('GeolocationService: Location services are disabled.');
      return LocationInitResult(
        service: service,
        locationServicesEnabled: false,
        permissionStatus: LocationPermissionStatus.serviceDisabled,
        initialPosition: null,
      );
    }
    LocationPermissionStatus permissionStatus =
        await service.handlePermission();
    Position? position;
    if (permissionStatus == LocationPermissionStatus.granted &&
        fetchInitialPosition) {
      talker?.info(
        'GeolocationService: Permissions granted. Fetching initial position...',
      );
      position = await service.getCurrentPosition(
        desiredAccuracy: initialAccuracy,
        timeLimit: timeLimit,
      );
      if (position == null) {
        talker?.warning(
          'GeolocationService: Failed to fetch initial position despite granted permissions.',
        );
      }
    } else if (fetchInitialPosition) {
      talker?.warning(
        'GeolocationService: Cannot fetch initial position due to permission status: $permissionStatus',
      );
    }

    final result = LocationInitResult(
      service: service,
      locationServicesEnabled: servicesEnabled,
      permissionStatus: permissionStatus,
      initialPosition: position,
    );
    talker?.info(
      'GeolocationService: Initialization complete. Result: $result',
    );
    return result;
  }

  /// Checks if location services are enabled on the device.
  Future<bool> isLocationServiceEnabled() async {
    final serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    _talker?.info('Location service enabled: $serviceEnabled');
    return serviceEnabled;
  }

  /// Handles location permission requests.
  /// Returns a [LocationPermissionStatus] indicating the outcome.
  Future<LocationPermissionStatus> handlePermission() async {
    // This check is now often done before calling handlePermission in the init method
    // but it's good to keep it for direct calls to handlePermission too.
    bool servicesEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!servicesEnabled) {
      _talker?.warning('Location services are disabled.');
      // It's important to distinguish this case. The `initialize` method handles this
      // by returning early, but if `handlePermission` is called directly,
      // it should reflect this.
      return LocationPermissionStatus.serviceDisabled;
    }
    LocationPermission permission = await _geolocatorPlatform.checkPermission();
    _talker?.info('Initial permission status: $permission');

    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      _talker?.info('Permission requested, new status: $permission');
      if (permission == LocationPermission.denied) {
        _talker?.warning('Location permission was denied.');
        return LocationPermissionStatus.denied;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _talker?.error('Location permission was permanently denied.');
      return LocationPermissionStatus.deniedForever;
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      _talker?.info('Location permission granted.');
      return LocationPermissionStatus.granted;
    }
    // Fallback for unexpected status
    _talker?.warning('Unknown or unhandled permission status: $permission');
    return LocationPermissionStatus.unknown;
  }

  /// Gets the current position of the device.
  Future<Position?> getCurrentPosition({
    LocationAccuracy desiredAccuracy = LocationAccuracy.high,
    Duration? timeLimit,
  }) async {
    _talker?.info('Attempting to get current position...');
    // Permission check should ideally happen before calling this,
    // for example, via the `initialize` method or a direct `handlePermission` call.
    // However, a safety check can be included.
    final currentPermissionStatus =
        await handlePermission(); // Re-check or rely on prior check
    if (currentPermissionStatus != LocationPermissionStatus.granted) {
      _talker?.warning(
        'Cannot get current position. Permission status: $currentPermissionStatus',
      );
      // Optionally, you could try to request permission again here, but it might be redundant
      // if `initialize` or `handlePermission` was just called.
      return null;
    }
    try {
      final position = await _geolocatorPlatform.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: desiredAccuracy,
          timeLimit: timeLimit,
        ),
      );
      _talker?.info('Current position obtained: $position');
      return position;
    } catch (e, st) {
      _talker?.handle(e, st, 'Error getting current position');
      return null;
    }
  }
  /// Opens the application settings page for this app.
  Future<bool> openAppSettings() async {
    _talker?.info('Attempting to open app settings...');
    final opened = await _geolocatorPlatform.openAppSettings();
    if (opened) {
      _talker?.info('Opened Application Settings.');
    } else {
      _talker?.error('Error opening Application Settings.');
    }
    return opened;
  }

  /// Opens the device's location settings page.
  Future<bool> openLocationSettings() async {
    _talker?.info('Attempting to open location settings...');
    final opened = await _geolocatorPlatform.openLocationSettings();
    if (opened) {
      _talker?.info('Opened Location Settings.');
    } else {
      _talker?.error('Error opening Location Settings.');
    }
    return opened;
  }

}
