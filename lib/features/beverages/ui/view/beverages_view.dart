import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/features.dart';

class BeveragesView extends StatelessWidget {
  const BeveragesView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStickyHeaderList(
      onPressed: () {
        context.navigateTo(ProductDetailsRoute());
      },
    );
  }
}
