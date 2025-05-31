// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/features/app/bloc/location_bloc.dart';
import 'package:mobile_shop/features/home/home.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({super.key, required this.widgets});

  final List<WidgetItem> widgets;
  @override
  Widget build(BuildContext context) {
    final sortedWidgets = List<WidgetItem>.from(widgets)
      ..sort((a, b) => a.position.compareTo(b.position));

    return CustomScrollView(
      slivers: [
        BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            return AppStatusBar(
              locationText: state.address ?? 'Loading location...',
              onAddressTap: () {},
              onNotificationTap: () {},
              onBookmarkTap: () {},
              onSearchTap: () {},
            );
          },
        ),
        ...sortedWidgets.map((widgetItem) {
          final contentWidget = _buildWidgetByType(context, widgetItem);

          return SliverPadding(
            sliver: contentWidget,
            padding: EdgeInsets.symmetric(vertical: 10),
          );
        }),
      ],
    );
  }

  Widget _buildWidgetByType(BuildContext context, WidgetItem item) {
    switch (item.type) {
      case WidgetType.clubCard:
        return AppClubCard(onTileTap: () {});
      case WidgetType.banner:
        return AppBanner(
          imageUrls: [],
          onButtonPressed: () {},
          onImageTap: () {},
        );
      case WidgetType.recommended:
        return AppRecommendedList(itemCount: 5);
      case WidgetType.slider:
        return AppSlider(promoItems: buildPromoItems());
      case WidgetType.category:
        return AppCategoryGrid(title: 'item.', itemCount: 5);
      case WidgetType.carousel:
        return AppCarousel(carouselImages: [], carouselCount: 5);
      case WidgetType.bestSeller:
        return AppBestseller(itemCount: 5);
      case WidgetType.newArrival:
        return AppNewArrivalsList(itemCount: 5);
    }
  }
}
