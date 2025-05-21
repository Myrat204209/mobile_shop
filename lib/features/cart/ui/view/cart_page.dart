import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/cart/cart.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CartView();
  }
}