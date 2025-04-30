// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

part 'app_club_card.part.dart';

class AppClubCard extends StatelessWidget {
  const AppClubCard({
    super.key,
    this.aspectRatio = 37 / 16,
    this.tileText = 'Клуб Друзей',
    this.itemCount = 3,
    required this.onTileTap,
  });
  final double aspectRatio;
  final VoidCallback onTileTap;
  final String tileText;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                tileText,
                style: AppTextStyle.text().lg().pageTitleBold(),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              dense: true,
              minTileHeight: 44,
              onTap: onTileTap,
              trailing: Icon(CupertinoIcons.arrow_right),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 15),
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return AppClubLoyaltyCard();
                  }
                  return AspectRatio(
                    aspectRatio: 3 / 5,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: kCircular10Border,

                        color: Colors.teal[100 * (index % 9)],
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Item $index'),
                      ),
                    ),
                  ).paddingOnly(right: 10);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
