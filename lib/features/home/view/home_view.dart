// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

//TODO: Spread the UI based code to app_ui package
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
          slivers: [
            AppStatusBar(
              locationText: 'Москва, ул. Тверская, д. 15',
              onAddressTap: () {},
              onNotificationTap: () {},
              onBookmarkTap: () {},
              onSearchTap: () {},
            ),
            AppClubCard(onTileTap: () {}),
            AppBanner(
              imageUrls: [
                'https://example.com/image1.jpg',
                'https://example.com/image2.jpg',
                'https://example.com/image3.jpg',
              ],
              onButtonPressed: () {},
              onImageTap: () {},
            ),
            AppSlider(sliderUrl: [], sliderCount: 5),
            AppCarousel(promoItems: buildPromoItems()),
            AppRecommendedList(title: 'Рекомендуемое', itemCount: 5),
            SliverPadding(padding: EdgeInsets.only(bottom: 10)),
            AppBestseller(itemCount: 5),
            // AppNewArrivalsList(),
            AppCategoryGrid(),
          ],
        );
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
