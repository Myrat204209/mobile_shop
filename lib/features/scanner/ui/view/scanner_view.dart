import 'dart:async' show StreamSubscription, unawaited;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

final MobileScannerController controller = MobileScannerController();

StreamSubscription<Object?>? _subscription;

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If the controller is not ready, do not try to start or stop it.
    // Permission dialogs can trigger lifecycle changes before the controller is ready.
    if (!controller.value.hasCameraPermission) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        // Restart the scanner when the app is resumed.
        // Don't forget to resume listening to the barcode events.
        _subscription = controller.barcodes.listen(_handleBarcode);

        unawaited(controller.start());
      case AppLifecycleState.inactive:
        // Stop the scanner when the app is paused.
        // Also stop the barcode events subscription.
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  @override
  void initState() {
    super.initState();
    // Start listening to lifecycle changes.
    WidgetsBinding.instance.addObserver(this);

    // Start listening to the barcode events.
    _subscription = controller.barcodes.listen(_handleBarcode);

    // Finally, start the scanner itself.
    unawaited(controller.start());
  }

  void _handleBarcode(BarcodeCapture barcodeCapture) {
    findBarcodeAtCenter(barcodeCapture, DeviceOrientation.portraitUp);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Future<void> dispose() async {
    // Stop listening to lifecycle changes.
    WidgetsBinding.instance.removeObserver(this);
    // Stop listening to the barcode events.
    unawaited(_subscription?.cancel());
    _subscription = null;
    // Dispose the widget itself.
    super.dispose();
    // Finally, dispose of the controller.
    await controller.dispose();
  }
}

Barcode? findBarcodeAtCenter(
  BarcodeCapture barcodeCapture,
  DeviceOrientation orientation,
) {
  _fixPortraitLandscape(barcodeCapture.size, orientation);
  for (final barcode in barcodeCapture.barcodes) {
    _fixCorners(barcode.corners);
    return barcode;
  }
  return null;
}

Size _fixPortraitLandscape(Size imageSize, DeviceOrientation orientation) {
  switch (orientation) {
    case DeviceOrientation.portraitUp:
    case DeviceOrientation.portraitDown:
      return Size(imageSize.shortestSide, imageSize.longestSide);
    case DeviceOrientation.landscapeLeft:
    case DeviceOrientation.landscapeRight:
      return Size(imageSize.longestSide, imageSize.shortestSide);
  }
}

List<Offset> _fixCorners(List<Offset> corners) {
  // Clone the original list to avoid side-effects
  final sorted = List<Offset>.from(corners)..sort((a, b) {
    // Prioritize y-axis (dy), and within that, the x-axis (dx)
    var compare = a.dy.compareTo(b.dy);
    if (compare == 0) {
      compare = a.dx.compareTo(b.dx);
    }
    return compare;
  });

  final topLeft = sorted.first; // smallest x, smallest y
  final topRight = sorted[1]; // larger x, smaller y
  final bottomLeft = sorted[2]; // smaller x, larger y
  final bottomRight = sorted.last; // larger x, larger y

  return [topLeft, topRight, bottomRight, bottomLeft];
}
