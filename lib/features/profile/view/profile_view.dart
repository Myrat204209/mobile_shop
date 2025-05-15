import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/profile/profile.dart';
import 'package:mobile_shop/features/profile/widgets/profile_details_tile.dart';
import 'package:mobile_shop/features/profile/widgets/profile_loyal_card.dart';
import 'package:mobile_shop/features/profile/widgets/profile_settings_tile.dart';
import 'package:mobile_shop/features/profile/widgets/profile_status_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileStatusBar(),

            ProfileDetailsTile(),
            ProfileLoyalCard(),

            Row(
              spacing: 10,
              children: [ProfileButton(), ProfileButton(), ProfileButton()],
            ).paddingSymmetric(vertical: 15),
          ],
        ).paddingSymmetric(horizontal: 15).colorize(Colors.white),

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSettingsTile(),
            ProfileSettingsTile(),
            ProfileSettingsTile(),
            ProfileSettingsTile(),
            ProfileSettingsTile(),
            ProfileSettingsTile(),
            ProfileSettingsTile(),
          ],
        ).colorize(Colors.white),
      ],
    ).colorize(AppColors.iconColor.withAlpha(20));
  }
}
