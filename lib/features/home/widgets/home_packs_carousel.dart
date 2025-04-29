import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomePacksCarousel extends StatelessWidget {
  const HomePacksCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 360 / 135,
        child: CarouselView(
          itemExtent: 115,
          shrinkExtent: 100,
          enableSplash: true,
          itemSnapping: true,
          shape: RoundedRectangleBorder(borderRadius: kCircular15Border),
          scrollDirection: Axis.horizontal,
          children: List.generate(
            5,
            (index) => Container(
              // width: 150,
              height: 135,
              color: Colors.red[100 * (index % 9 + 1)],
              alignment: Alignment.center,
              child: Text(index.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
