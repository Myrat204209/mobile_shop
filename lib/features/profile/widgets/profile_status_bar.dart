import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class ProfileStatusBar extends StatelessWidget {
  const ProfileStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.store_rounded, size: 30, color: AppColors.mainAccent),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: AppBarMarqueeText(placemarkText: ' sdsdfdsf'),
          ),
        ),
        AppActionIcon(
          icon: CupertinoIcons.chevron_right,
          onTap: () {},
          size: 20,
        ),
      ],
    );
  }
}
