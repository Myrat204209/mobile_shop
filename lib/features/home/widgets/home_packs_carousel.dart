import 'package:flutter/material.dart';

// class HomePacksCarousel extends StatelessWidget {
//   const HomePacksCarousel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: CarouselSlider.builder(
//         itemCount: 10,
//         itemBuilder: (context, index, realIndex) {
//           return Container(
//             decoration: BoxDecoration(
//               color: Colors.red[100 * (index % 9)],
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.black),
//             ),
//             margin: EdgeInsets.symmetric(horizontal: 5),
//             alignment: Alignment.center,
//             child: Text('$index'),
//           );
//         },
//         options: CarouselOptions(
//           autoPlay: true,
//           viewportFraction: 0.347,
//           height: 150,
//           animateToClosest: true,
//           disableCenter: true,
//         ),
//       ),
//     );
//   }
// }

class HomePacksCarousel extends StatelessWidget {
  const HomePacksCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 180),

        child: CarouselView(
          itemExtent: 150,
          shrinkExtent: 115,
          enableSplash: true,
          itemSnapping: true,

          scrollDirection: Axis.horizontal,
          children: List.generate(
            5,
            (index) => Container(
              // width: 150,
              height: 150,
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
