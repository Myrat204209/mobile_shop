import 'dart:async' show FutureOr;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_shop/core/core.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

typedef AppBuilder = FutureOr<Widget> Function();
Future<void> bootStrap(Talker talker, AppBuilder builder) async {
  await runTalkerZonedGuarded<Future<void>>(
    talker,
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // await SentryFlutter.init((options) {
      //   options.dsn = 'https://b3aa888e7f33c4ed1bf258b42a1389d1@o4509077517172736.ingest.de.sentry.io/4509077619343440';
      // });
      Bloc.observer = TalkerBlocObserver(talker: talker);
      final geoInitResult = await LocationService.init(
        fetchInitialPosition: true,
        talker: talker,
        initialAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 15),
      );
      // You can now access the results of the initialization
      talker.info('Geolocation Initialized:');
      talker.info(
        '  Services Enabled: ${geoInitResult.locationServicesEnabled}',
      );
      talker.info('  Permission Status: ${geoInitResult.permissionStatus}');
      if (geoInitResult.initialPosition != null) {
        talker.info('  Initial Position: ${geoInitResult.initialPosition}');
      } else {
        talker.info('  Initial Position: Not fetched or unavailable.');
      }
      // --- Actions based on geolocation initialization ---
      if (!geoInitResult.locationServicesEnabled) {
        talker.warning(
          'Bootstrap: Location services are disabled. Consider prompting user.',
        );
        // Example: You might show a dialog or navigate to a screen asking to enable location.
        // await geoInitResult.service.openLocationSettings(); // Example
      } else if (geoInitResult.permissionStatus ==
          LocationPermissionStatus.deniedForever) {
        talker.error(
          'Bootstrap: Location permission permanently denied. Prompting to open app settings.',
        );
        // Example: You might show a persistent message or dialog.
        // await geoInitResult.service.openAppSettings(); // Example
      } else if (geoInitResult.permissionStatus ==
          LocationPermissionStatus.denied) {
        talker.warning(
          'Bootstrap: Location permission denied. Functionality may be limited.',
        );
        // You might try to request again later or explain why it's needed.
      }

      if (geoInitResult.canProceedWithLocation) {
        
        talker.info("Bootstrap: Location is ready to be used.");
        // Use geoInitResult.initialPosition if needed
      }
      runApp(await builder());
    },

    (exception, stackTrace) async {
      // await Sentry.captureException(exception, stackTrace: stackTrace);
      FlutterError.onError =
          (details) =>
              talker.error('Error has happened', exception, stackTrace);
      PlatformDispatcher.instance.onError = (error, stack) {
        talker.error("PlatformDispatcherError has happened", error, stack);
        return true;
      };
    },
  );
}
