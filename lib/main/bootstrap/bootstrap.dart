import 'dart:async' show FutureOr;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

typedef AppBuilder = FutureOr<Widget> Function();
final _talker = GetIt.I<Talker>();
Future<void> bootStrap(AppBuilder builder) async {
  await runTalkerZonedGuarded<Future<void>>(
    _talker,
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // Initialize any other services or dependencies here

      Bloc.observer = TalkerBlocObserver(talker: _talker);
      runApp(await builder());
    },
    (exception, stackTrace) async {
      FlutterError.onError =
          (details) =>
              _talker.error('Error has happened', exception, stackTrace);
      PlatformDispatcher.instance.onError = (error, stack) {
        _talker.error("PlatformDispatcherError has happened", error, stack);
        return true;
      };
    },
  );
}
