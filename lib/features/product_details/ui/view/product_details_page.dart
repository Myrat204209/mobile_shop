import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/product_details/product_details.dart';

@RoutePage()
class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductDetailsView();
  }
}
