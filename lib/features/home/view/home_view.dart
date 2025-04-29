// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/home/home.dart';

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
            HomeTitleListTile(title: 'Большой баннер.'),
            HomeAdBanner(),
            HomeTitleListTile(title: 'Мини-баннер'),
            HomePacksCarousel(),
            HomeTitleListTile(title: 'Пролистывающийся баннер.'),
            HomePromoCarousel(promoItems: buildPromoItems()),
            HomeTitleListTile(title: 'Блок с акционной продукцией'),
            HomeDiscountsSlider(),
            HomeUserSpecialsSlider(),
            HomeTitleListTile(title: 'Большой рекламный баннер.'),
            HomeAdBanner(isBanner: true),
            HomeUserPurchasesCard(),
          ],
        );
      },
    );
  }
}

class HomeTitleListTile extends StatelessWidget {
  const HomeTitleListTile({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        title: Text(title, style: AppTextStyle.display().semiBold()),
      ),
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
        borderRadius: kCircular10Border,
      ),
      child: const Center(child: Text('Coupon 1: -10%')),
    ),
    // Example Banner 2
    Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue[300],
        borderRadius: kCircular10Border,
      ),
      child: const Center(child: Text('Special Offer!')),
    ),
    // Example Banner 3
    Container(
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: kCircular10Border,
      ),
      child: const Center(child: Text('Buy 1 Get 1 Free')),
    ),
    // Add more banners...
  ];
}
