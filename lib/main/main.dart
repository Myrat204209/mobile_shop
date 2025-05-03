import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_provider/data_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mobile_shop/features/features.dart';
import 'package:mobile_shop/main/bootstrap/bootstrap.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  final talker = TalkerFlutter.init();
  final router = AppRouter();
  final connectivity = Connectivity();
  getIt.registerSingleton<Talker>(talker);
  getIt.registerSingleton<AppRouter>(router);
  bootStrap(talker, () async {
    const defaultBaseUrl = 'http://BASEURL';
    final httpClient = Http(defaultBaseUrl: defaultBaseUrl);
    HttpOverrides.global = MyHttpOverrides();

    await Hive.initFlutter();
    // Hive.registerAdapters();
    return App(connectivity: connectivity);
  });
}
