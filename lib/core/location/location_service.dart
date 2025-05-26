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

    Position? position;
    bool finalServicesEnabled;
    LocationPermissionStatus finalAppPermissionStatus =
        LocationPermissionStatus.unknown;
    bool servicesAreCurrentlyEnabled = await service.isLocationServiceEnabled();
    if (!servicesAreCurrentlyEnabled) {
      talker?.warning(
        'GeolocationService: Device Location Services are OFF. Attempting to open location settings...',
      );
      await service
          .openLocationSettings(); // Guide user to enable system-wide location
      servicesAreCurrentlyEnabled =
          await service
              .isLocationServiceEnabled(); // Re-check after user returns (or attempts)

      if (servicesAreCurrentlyEnabled) {
        
    service._geolocatorPlatform.getCurrentPosition();
        talker?.info(
          'GeolocationService: Device Location Services are NOW ENABLED after user action.',
        );
      } else {
        talker?.error(
          'GeolocationService: Device Location Services REMAIN OFF. Cannot proceed with app permissions.',
        );
        // If services are still off, further app permission checks are futile.
        return LocationInitResult(
          service: service,
          locationServicesEnabled: false,
          permissionStatus: LocationPermissionStatus.serviceDisabled,
          initialPosition: null,
        );
      }
    } else {
      talker?.info('GeolocationService: Device Location Services are ON.');
    }
    finalServicesEnabled = true; // At this point, services should be on

    // bool servicesEnabled = await service.isLocationServiceEnabled();
    // if (!servicesEnabled) {
    //   talker?.warning('GeolocationService: Location services are disabled.');
    //   await service.handlePermission();
    //   //  await _geolocatorPlatform!.requestPermission();
    //   //   return LocationInitResult(
    //   //     service: service,
    //   //     locationServicesEnabled: false,
    //   //     permissionStatus: LocationPermissionStatus.serviceDisabled,
    //   //     initialPosition: null,
    //   //   );
    // }
    // LocationPermissionStatus permissionStatus =
    //     await service.handlePermission();
    // if (permissionStatus == LocationPermissionStatus.granted &&
    //     fetchInitialPosition) {
    //   talker?.info(
    //     'GeolocationService: Permissions granted. Fetching initial position...',
    //   );
    //   position = await service.getCurrentPosition(
    //     desiredAccuracy: initialAccuracy,
    //     timeLimit: timeLimit,
    //   );
    //   if (position == null) {
    //     talker?.warning(
    //       'GeolocationService: Failed to fetch initial position despite granted permissions.',
    //     );
    //   }
    // } else if (fetchInitialPosition) {
    //   talker?.warning(
    //     'GeolocationService: Cannot fetch initial position due to permission status: $permissionStatus',
    //   );
    // }

    // final result = LocationInitResult(
    //   service: service,
    //   locationServicesEnabled: servicesEnabled,
    //   permissionStatus: permissionStatus,
    //   initialPosition: position,
    // );
    // talker?.info(
    //   'GeolocationService: Initialization complete. Result: $result',
    // );
    // --- Step 2: Handle App-Specific Permissions ---
    // `handlePermission()` checks current status, and if denied, requests once.
    LocationPermissionStatus appStatusAfterInitialCheck =
        await service.handlePermission();

    if (appStatusAfterInitialCheck == LocationPermissionStatus.granted) {
      talker?.info(
        'GeolocationService: App permission is GRANTED after initial check/request.',
      );
      finalAppPermissionStatus = LocationPermissionStatus.granted;
    } else {
      talker?.warning(
        'GeolocationService: App permission is $appStatusAfterInitialCheck. Services are ON.',
      );

      // If app permission is denied/deniedForever (and services are ON), open app settings.
      // Or if serviceDisabled was returned by handlePermission (edge case: it got disabled just now)
      if (appStatusAfterInitialCheck == LocationPermissionStatus.denied ||
          appStatusAfterInitialCheck ==
              LocationPermissionStatus.deniedForever) {
        talker?.info(
          'GeolocationService: App permission $appStatusAfterInitialCheck. Attempting to open APP settings...',
        );
        await service.openAppSettings(); // Guide user to app-specific settings
        // Re-check app permission status after user returns from app settings
        finalAppPermissionStatus =
            await service.handlePermission(); // Re-evaluate

        if (finalAppPermissionStatus == LocationPermissionStatus.granted) {
          talker?.info(
            'GeolocationService: App permission NOW GRANTED after user action in app settings.',
          );
        } else {
          talker?.error(
            'GeolocationService: App permission REMAINS $finalAppPermissionStatus after attempting to open app settings.',
          );
        }
      } else if (appStatusAfterInitialCheck ==
          LocationPermissionStatus.serviceDisabled) {
        // This is an edge case: services were ON, but handlePermission found them OFF.
        // This implies the user turned them off extremely quickly or there's a detection lag.
        talker?.error(
          'GeolocationService: Device Location Services became disabled before app permission could be fully resolved. This is unexpected.',
        );
        // Report this inconsistent state.
        finalServicesEnabled =
            false; // Update our understanding of service state
        finalAppPermissionStatus = LocationPermissionStatus.serviceDisabled;
      } else {
        // For other statuses like .unknown
        finalAppPermissionStatus = appStatusAfterInitialCheck;
        talker?.warning(
          'GeolocationService: App permission is in an unexpected state: $finalAppPermissionStatus',
        );
      }
    }
    if (finalServicesEnabled &&
        finalAppPermissionStatus == LocationPermissionStatus.granted) {
      talker?.info(
        'GeolocationService: All permissions good. Fetching initial position...',
      );
      if (fetchInitialPosition) {
        position = await service.getCurrentPosition(
          desiredAccuracy: initialAccuracy,
          timeLimit: timeLimit,
        );
        if (position != null) {
          talker?.info(
            'GeolocationService: Initial position obtained: $position',
          );
        } else {
          talker?.warning(
            'GeolocationService: Failed to obtain initial position despite permissions.',
          );
        }
      }
    } else {
      talker?.error(
        'GeolocationService: Cannot fetch position. Final Device Services Enabled: $finalServicesEnabled, Final App Permission: $finalAppPermissionStatus',
      );
    }
    return LocationInitResult(
      service: service,
      locationServicesEnabled: finalServicesEnabled,
      permissionStatus: finalAppPermissionStatus,
      initialPosition: position,
    );

    // return result;
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
      // // it should reflect this.
      // return LocationPermissionStatus.serviceDisabled;
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
