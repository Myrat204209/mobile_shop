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
        aspectRatio: 392 / 262,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              'Рекомендуемое',
              style: AppTextStyle.text().extrabold().xxl(),
            ).paddingSymmetric(horizontal: 10),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                itemCount: itemCount + 1,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 118 / 218,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        color:
                            index == itemCount
                                ? Colors.white
                                : Colors.red[100 * (index % 9 + 1)]!,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                          index == itemCount
                              ? Text('Все->').centralize()
                              : Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 118 / 110,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: AppColors.majorAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Column()),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton.outlined(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                      iconSize: 30,

                                      padding: EdgeInsets.zero,
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          AppColors.mainAccent,
                                        ),
                                      ),
                                    ).paddingSymmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                    ),
                  ).paddingSymmetric(horizontal: 5);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
