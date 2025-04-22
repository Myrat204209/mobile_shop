import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePromoCarousel extends StatefulWidget {
  // You would typically pass the data for the carousel items here
  final List<Widget> promoItems;

  const HomePromoCarousel({
    super.key,
    required this.promoItems, // List of Widgets to display in the carousel
  });

  @override
  State<HomePromoCarousel> createState() => _HomePromoCarouselState();
}

class _HomePromoCarouselState extends State<HomePromoCarousel> {
  int _currentIndex = 0; // State variable to track the active index
  final _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    // Use SliverToBoxAdapter to place this non-sliver widget inside CustomScrollView
    return SliverToBoxAdapter(
      child: Container(
        // Add padding or margin around the whole component if needed
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        color: Colors.grey[200], // Background color similar to the image
        child: Column(
          mainAxisSize: MainAxisSize.min, // Take minimum vertical space
          children: [
            CarouselSlider(
              items: widget.promoItems,
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 150.0, // Adjust height based on your banner design
                autoPlay: true, // Optional: if you want auto-scrolling
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction:
                    0.9, // How much of next/prev items are visible
                enlargeCenterPage: true, // Make the center item slightly larger
                enlargeFactor: 0.1,
                aspectRatio: 16 / 6, // Adjust aspect ratio for your banners
                // Callback when page changes
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Update the active index
                  });
                },
              ),
            ),
            const SizedBox(height: 10), // Space between carousel and indicators
            // Build the indicators dynamically
            _buildIndicators(),
          ],
        ),
      ),
    );
  }

  // Helper method to build the indicator dots
  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          widget.promoItems.asMap().entries.map((entry) {
            int index = entry.key;
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(index),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // Use different color for the active dot
                  color:
                      _currentIndex == index
                          ? Colors
                              .orangeAccent // Active dot color
                          : Colors.grey, // Inactive dot color
                ),
              ),
            );
          }).toList(),
    );
  }
}
