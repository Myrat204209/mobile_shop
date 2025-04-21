import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/discount/discount.dart';

@RoutePage()
class DiscountPage extends StatelessWidget {
  const DiscountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DiscountView();
  }
}