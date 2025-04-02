import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            try {
              throw StateError('This is test exception');
            } catch (e) {
              Sentry.captureException(e);
            }
          },
          child: const Text('Verify Sentry Setup'),
        ),
      ),
    );
  }
}
