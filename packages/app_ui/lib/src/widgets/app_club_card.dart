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
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              dense: true,
              minTileHeight: 44,
              onTap: onTileTap,
              trailing: Icon(CupertinoIcons.arrow_right),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: 8),
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return AppClubLoyaltyCard();
                  }
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 85,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: kCircular10Border,

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

// class AppClubCard extends StatelessWidget {
//   const AppClubCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 17 / 10,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         color: AppColors.mainAccent,
//         margin: EdgeInsets.only(right: 10),
//         child: Padding(
//           padding: const EdgeInsets.all(7.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       spacing: 4,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         LoyaltyHeadlineText(text: 'Друг'),
//                         LoyaltyHeadlineText(text: '1.5% кешбэк'),

//                         Text(
//                           'Ещё 4 дня покупок до 1% в следующем месяце',
//                           softWrap: true, // Ensure text wraps
//                           style: AppTextStyle.text().xs().medium().withColor(
//                             Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox.square(
//                     dimension: 70,
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: kCircular10Border,
//                       ),
//                       child: FlutterLogo(),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: Icon(Icons.apple, size: 40),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       color: Colors.white.withValues(alpha: 0.4),
//                       thickness: 4,
//                     ),
//                   ),
//                   Icon(
//                     Icons.lock_outline_rounded,
//                     color: Colors.white.withValues(alpha: 0.8),
//                     size: 18,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //TODO: Remove the similar code block from home_friends_slider
// class LoyaltyHeadlineText extends StatelessWidget {
//   const LoyaltyHeadlineText({super.key, required this.text});
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: AppTextStyle.text().md().extrabold().withColor(Colors.white),
//     );
//   }
// }
