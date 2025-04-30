// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppBestseller extends StatelessWidget {
  const AppBestseller({
    super.key,
    required this.itemCount,
    this.bannerVisible = false,
  });

  final int itemCount;
  final bool bannerVisible;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 392 / 218,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          itemCount: itemCount + 1,
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 118 / 218,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0.1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color:
                    index == itemCount
                        ? Colors.white
                        : Colors.blue[100 * (index % 9 + 1)]!,

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
                                  color: AppColors.secondAccent,
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
    );
  }
}
