import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/profile/profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
        ),

        ListTile(
          leading: CircleAvatar(
            radius: 25,
            child: Icon(Icons.apple, size: 45).centralize(),
          ),
          title: Text(
            'Имя пользователя',
            style: AppTextStyle.text().lg().bold(),
          ),
          contentPadding: EdgeInsets.zero,
          subtitle: GestureDetector(
            onTap: () {
              log('Printed..');
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Личные данные',
                  style: AppTextStyle.text().sm().medium().withColor(
                    AppColors.textLight,
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  size: 16,
                  color: AppColors.iconColor,
                ).paddingOnly(left: 5),
              ],
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell)),
              IconButton(onPressed: () {}, icon: Icon(Icons.chat_outlined)),
            ],
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.mainAccent,
            borderRadius: kCircular15Border,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Drug',
                    style: AppTextStyle.text().md().bold().withColor(
                      AppColors.bgMain,
                    ),
                  ),
                  Text(
                    '1.5%',
                    style: AppTextStyle.text().md().bold().withColor(
                      AppColors.bgMain,
                    ),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      ProfileCardChip(),
                      ProfileCardChip(),
                      ProfileCardChip(),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 10),

              SizedBox.square(
                dimension: 80,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: kCircular10Border,
                    color: AppColors.bgMain,
                  ),
                ),
              ).paddingAll(5),
            ],
          ),
        ),

        Row(
          spacing: 10,
          children: [ProfileButton(), ProfileButton(), ProfileButton()],
        ),
      ],
    ).paddingAll(15);
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: kCircular10Border,
          border: Border.all(color: AppColors.iconColor.withValues(alpha: 0.2)),
        ),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.shopping_bag_outlined).paddingOnly(top: 5),
            Text(
              'Покупки',
              style: AppTextStyle.text().title().semiBold(),
            ).paddingOnly(bottom: 5),
          ],
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}
