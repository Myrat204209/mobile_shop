import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class HomeFriendsSlider extends StatelessWidget {
  const HomeFriendsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Клуб Друзей',
                style: AppTextStyle.display().pageTitleBold(),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 4),
              onTap: () {
                // context.pushRoute(routes.friendsRoute());
              },
              trailing: Icon(CupertinoIcons.arrow_right),
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      width: 230,
                      height: 120,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainAccent,
                      ),
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Друг',
                                style: AppTextStyle.text()
                                    .lg()
                                    .semiBold()
                                    .withColor(Colors.white),
                              ),
                              Text(
                                '1.5%',
                                style: AppTextStyle.text()
                                    .lg()
                                    .semiBold()
                                    .withColor(Colors.white),
                              ),
                              FittedBox(
                                child: Text(
                                  'Ещё 4 дня покупок до 1% в следующем месяце',
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                  style: AppTextStyle.text()
                                      .sm()
                                      .semiBold()
                                      .withColor(Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: SizedBox.square(
                              dimension: 60,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 65,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      color: Colors.teal[100 * (index % 9)],
                    ),
                    child: Text('Item $index'),
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
