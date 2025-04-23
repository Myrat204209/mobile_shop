import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class HomePromoCarousel extends StatefulWidget {
  final List<Widget> promoItems;

  const HomePromoCarousel({super.key, required this.promoItems});

  @override
  State<HomePromoCarousel> createState() => _HomePromoCarouselState();
}

class _HomePromoCarouselState extends State<HomePromoCarousel> {
  int _currentIndex = 0;
  final _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        color: Colors.grey[200],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider(
              items: widget.promoItems,
              controller: _carouselController,
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeFactor: 0.1,
                aspectRatio: 16 / 6,

                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),

            _buildIndicators(),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          widget.promoItems.asMap().entries.map((entry) {
            int index = entry.key;
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(index),
              child: Container(
                width: _currentIndex == index ? 18.0 : 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape:
                      _currentIndex == index
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                  borderRadius:
                      _currentIndex == index ? BorderRadius.circular(5) : null,
                  color:
                      _currentIndex == index
                          ? Colors.orangeAccent
                          : Colors.grey,
                ),
              ),
            );
          }).toList(),
    );
  }
}
