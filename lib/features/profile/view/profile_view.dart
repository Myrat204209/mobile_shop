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
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.store_rounded,
                  size: 30,
                  color: AppColors.mainAccent,
                ),
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
              dense: true,
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
            ).paddingSymmetric(vertical: 15),
          ],
        ).paddingSymmetric(horizontal: 15).colorize(Colors.white),

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileTile(),
            ProfileTile(),
            ProfileTile(),
            ProfileTile(),
            ProfileTile(),
            ProfileTile(),
            ProfileTile(),
          ],
        ).colorize(Colors.white),
      ],
    ).colorize(AppColors.iconColor.withAlpha(20));
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: SizedBox.square(
            dimension: 40,
            child: Icon(Icons.shopping_bag_outlined),
          ).colorize(AppColors.iconColor.withAlpha(20)),
          title: Text('Заказы'),
          subtitle: Text('data'),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_right_outlined),
          ),
          dense: true,
          visualDensity: VisualDensity.compact,
        ),
        Divider(
          indent: 60,
          height: 5,
          endIndent: 30,
          color: AppColors.iconColor.withAlpha(20),
        ),
      ],
    );
  }
}
