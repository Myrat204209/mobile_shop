import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppNewArrivalsList extends StatelessWidget {
  const AppNewArrivalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainAccent,
        ),
        child: AspectRatio(
          aspectRatio: 98 / 95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Новинки',
                style: AppTextStyle.text().extrabold().xl(),
              ).paddingAll(10).paddingOnly(left: 5),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 175 / 305,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // Use a different color for the last item
                          color: Colors.red[100 * (index % 9 + 1)]!,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
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
                    ).paddingSymmetric(horizontal: 10).paddingOnly(bottom: 15);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
