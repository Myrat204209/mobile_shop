import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

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
