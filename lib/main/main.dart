import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_provider/data_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile_shop/core/location/location.dart';
import 'package:mobile_shop/features/features.dart';
import 'package:mobile_shop/main/bootstrap/bootstrap.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  final talker = TalkerFlutter.init();
  getIt.registerSingleton<Talker>(talker);
  final router = AppRouter();
  getIt.registerSingleton<AppRouter>(router);
  final connectivity = Connectivity();
  final geoInitResult = await LocationService.init(fetchInitialPosition: true,talker: talker,
  initialAccuracy: LocationAccuracy.high,
  timeLimit: const Duration(seconds: 15),
  );
  getIt.registerSingleton<LocationService>(geoInitResult.service);
  // You can now access the results of the initialization
  talker.info('Geolocation Initialized:');
  talker.info('  Services Enabled: ${geoInitResult.locationServicesEnabled}');
  talker.info('  Permission Status: ${geoInitResult.permissionStatus}');
  if (geoInitResult.initialPosition != null) {
    talker.info('  Initial Position: ${geoInitResult.initialPosition}');
  } else {
    talker.info('  Initial Position: Not fetched or unavailable.');
  }

  bootStrap(talker, () async {
    const defaultBaseUrl = 'http://172.16.25.24:8080';
    final httpClient = Http(defaultBaseUrl: defaultBaseUrl);

    final preloaderRepository = PreloaderRepository(
      preloaderClient: PreloaderClient(httpClient),
    );
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getApplicationDocumentsDirectory()).path,
      ),
    );

    HttpOverrides.global = MyHttpOverrides();
     // --- Actions based on geolocation initialization ---
    if (!geoInitResult.locationServicesEnabled) {
      talker.warning('Bootstrap: Location services are disabled. Consider prompting user.');
      // Example: You might show a dialog or navigate to a screen asking to enable location.
      // await geoInitResult.service.openLocationSettings(); // Example
    } else if (geoInitResult.permissionStatus == LocationPermissionStatus.deniedForever) {
      talker.error('Bootstrap: Location permission permanently denied. Prompting to open app settings.');
      // Example: You might show a persistent message or dialog.
      // await geoInitResult.service.openAppSettings(); // Example
    } else if (geoInitResult.permissionStatus == LocationPermissionStatus.denied) {
      talker.warning('Bootstrap: Location permission denied. Functionality may be limited.');
      // You might try to request again later or explain why it's needed.
    }

    if (geoInitResult.canProceedWithLocation) {
        talker.info("Bootstrap: Location is ready to be used.");
        // Use geoInitResult.initialPosition if needed
    }

    await Hive.initFlutter();
    // Hive.registerAdapters();
    return App(
      connectivity: connectivity,
      preloaderRepository: preloaderRepository,
    );
  });
}
