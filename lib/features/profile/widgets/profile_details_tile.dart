import 'dart:developer';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class ProfileDetailsTile extends StatelessWidget {
  const ProfileDetailsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        child: Icon(Icons.apple, size: 45).centralize(),
      ),
      title: Text('Имя пользователя', style: AppTextStyle.text().lg().bold()),
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
    );
  }
}
