
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class HomePacksCarousel extends StatelessWidget {
  const HomePacksCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.red[100 * (index % 9)],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            margin: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            child: Text('$index'),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 0.347,
          height: 150,
          animateToClosest: true,
          disableCenter: true,
        ),
      ),
    );
  }
}
