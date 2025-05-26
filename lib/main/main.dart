import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_provider/data_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

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

    await Hive.initFlutter();
    // Hive.registerAdapters();
    return App(
      connectivity: connectivity,
      preloaderRepository: preloaderRepository,
    );
  });
}
