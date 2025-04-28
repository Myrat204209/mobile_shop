// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class HomeFriendsSlider extends StatelessWidget {
  const HomeFriendsSlider({super.key, required this.friends});

  final List friends;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            height: MediaQuery.sizeOf(context).height * 125 / 872,

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
      ).paddingOnly(left: 10),
    );
  }
}

class HomeLoyaltyCard extends StatelessWidget {
  const HomeLoyaltyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 5,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.mainAccent,
        margin: EdgeInsets.only(right: 10),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoyaltyHeadlineText(text: 'Друг'),
                        LoyaltyHeadlineText(text: '1.5% кешбэк'),

                        Text(
                          'Ещё 4 дня покупок до 1% в следующем месяце',
                          softWrap: true,
                          style: AppTextStyle.text().xxs().semiBold().withColor(
                            Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox.square(
                    dimension: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FlutterLogo(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 15,
                    child: Icon(Icons.apple, size: 30),
                  ),
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
      style: AppTextStyle.text().sm().extrabold().withColor(Colors.white),
    );
  }
}
