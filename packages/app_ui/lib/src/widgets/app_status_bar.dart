import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AppStatusBar extends StatelessWidget {
  const AppStatusBar({
    super.key,
    this.locationText,
    required this.onAddressTap,
    required this.onNotificationTap,
    required this.onBookmarkTap,
    required this.onSearchTap,
  });

  final String? locationText;
  final VoidCallback onAddressTap;
  final VoidCallback onNotificationTap;
  final VoidCallback onBookmarkTap;
  final VoidCallback onSearchTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      primary: true,
      actionsPadding: EdgeInsets.zero,
      expandedHeight: 100,
      titleSpacing: 0,
      leading: Icon(
        Icons.directions_bike_outlined,
        size: 30,
        color: AppColors.secondAccent,
      ),

      leadingWidth: 50,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: AppBarMarqueeText(placemarkText: locationText)),
          AppActionIcon(
            icon: CupertinoIcons.chevron_right,
            onTap: onAddressTap,
            size: 20,
          ),
        ],
      ),
      floating: true,
      pinned: true,
      actions: [
        AppActionIcon(icon: CupertinoIcons.bell, onTap: onNotificationTap),
        AppActionIcon(
          icon: Icons.bookmark_border_outlined,
          onTap: onBookmarkTap,
        ),
      ],
      snap: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: AppSearchBar(),
      ),
    );
  }
}

class AppBarMarqueeText extends StatelessWidget {
  const AppBarMarqueeText({super.key, required this.placemarkText});

  final String? placemarkText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Marquee(
        text: placemarkText ?? 'Выбрать адрес',
        style: AppTextStyle.text().medium().withColor(Color(0xFF707578)),
        scrollAxis: Axis.horizontal,

        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 20.0,
        velocity: 100.0,
        pauseAfterRound: Duration(seconds: 1),

        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}
