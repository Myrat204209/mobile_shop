// ignore_for_file: public_member_api_docs, sort_constructors_first
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
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return HomeLoyaltyCard();
                  }
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 85,
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

class HomeLoyaltyCard extends StatelessWidget {
  const HomeLoyaltyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 17 / 10,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: AppColors.mainAccent,
        margin: EdgeInsets.only(right: 10),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoyaltyHeadlineText(text: 'Друг'),
                        LoyaltyHeadlineText(text: '1.5% кешбэк'),

                        Text(
                          'Ещё 4 дня покупок до 1% в следующем месяце',
                          softWrap: true, // Ensure text wraps
                          style: AppTextStyle.text().xs().regular().withColor(
                            Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox.square(
                    dimension: 75,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.apple, color: Colors.greenAccent, size: 40),
                  Expanded(
                    child: Divider(
                      color: Colors.white.withValues(alpha: 0.4),
                      thickness: 4,
                    ),
                  ),
                  Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoyaltyHeadlineText extends StatelessWidget {
  const LoyaltyHeadlineText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.text().md().extrabold().withColor(Colors.white),
    );
  }
}
