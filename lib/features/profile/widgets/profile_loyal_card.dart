import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/profile/profile.dart';

class ProfileLoyalCard extends StatelessWidget {
  const ProfileLoyalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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

          ProfileQRBox().paddingAll(5),
        ],
      ),
    );
  }
}
