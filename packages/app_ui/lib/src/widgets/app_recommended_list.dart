// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppRecommendedList extends StatelessWidget {
  const AppRecommendedList({
    super.key,
    required this.title,
    required this.itemCount,
    this.bannerVisible = false,
  });

  final String title;
  final bool bannerVisible;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 12 / 25,
        child: Column(
          children: [
            Text('Рекомендуемое', style: AppTextStyle.display().semiBold()),

            AspectRatio(
              aspectRatio: 59 / 109,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ColoredBox(
                    color: Colors.red[100 * (index % 9 + 1)]!,

                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        bannerVisible ? '%' : '$index',
                        style:
                            bannerVisible
                                ? AppTextStyle.display()
                                    .semiBold()
                                    .withFontSize(150)
                                : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
