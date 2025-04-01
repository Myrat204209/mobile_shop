import 'package:get_it/get_it.dart';
import 'package:mobile_shop/app/app.dart';
import 'package:mobile_shop/main/bootstrap/bootstrap.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;

void main() {
  bootStrap(() async {
    final talker = Talker();
    final router = AppRouter();
    getIt.registerSingleton<AppRouter>(router);
    getIt.registerSingleton<Talker>(talker);
    return App();
  });
}
