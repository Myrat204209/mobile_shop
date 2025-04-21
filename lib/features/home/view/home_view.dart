import 'package:flutter/material.dart';
import 'package:mobile_shop/features/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [HomeLocationSearchAppBar(), HomeFriendsSlider()],
    );
  }
}
