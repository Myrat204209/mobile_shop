import 'package:get_it/get_it.dart';
import 'package:mobile_shop/features/features.dart';
import 'package:mobile_shop/main/bootstrap/bootstrap.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  final talker = TalkerFlutter.init();
  final router = AppRouter();
  getIt.registerSingleton<Talker>(talker);
  getIt.registerSingleton<AppRouter>(router);

  bootStrap(talker, () {
    return App();
  });
}
