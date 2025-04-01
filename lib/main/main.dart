import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_shop/main/bootstrap/bootstrap.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;
final talker = Talker();
void main() {
  bootStrap(() async {
    getIt.registerSingleton<Talker>(talker);
    return App();
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
