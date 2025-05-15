// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/core/core.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.pageItem});

  final PageItem pageItem;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return PageLayout(widgets: pageItem.widgets);
      },
    );
  }
}
List<Widget> buildPromoItems() {
  return [
    // Example Banner 1
    Container(
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: kCircular10Border,
      ),
      child: const Center(child: Text('Coupon 1: -10%')),
    ).paddingSymmetric(horizontal: 10),
    // Example Banner 2
    Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[300],
        borderRadius: kCircular10Border,
      ),
      child: const Center(child: Text('Special Offer!')),
    ).paddingSymmetric(horizontal: 10),
    // Example Banner 3
    Container(
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: kCircular10Border,
      ),
      child: const Center(child: Text('Buy 1 Get 1 Free')),
    ).paddingSymmetric(horizontal: 10),
    // Add more banners...
  ];
}
