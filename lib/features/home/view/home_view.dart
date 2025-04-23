import 'package:flutter/material.dart';
import 'package:mobile_shop/features/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeLocationSearchAppBar(),
        HomeFriendsSlider(),
        HomeAdBanner(),
        HomePacksCarousel(),
        HomeAdBanner(isBanner: true),
        HomePromoCarousel(promoItems: buildPromoItems()),
      ],
    );
  }
}

// Example list of banner widgets (replace with your actual banner widgets)
List<Widget> buildPromoItems() {
  return [
    // Example Banner 1
    Container(
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(child: Text('Coupon 1: -10%')),
    ),
    // Example Banner 2
    Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(child: Text('Special Offer!')),
    ),
    // Example Banner 3
    Container(
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(child: Text('Buy 1 Get 1 Free')),
    ),
    // Add more banners...
  ];
}
