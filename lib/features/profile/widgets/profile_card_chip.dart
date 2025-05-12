import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProfileCardChip extends StatelessWidget {
  const ProfileCardChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(
        Icons.pending,
        color: AppColors.mainAccent,
      ),
      avatarBoxConstraints: BoxConstraints(maxWidth: 25),
      label: Text(
        '0',
        style: AppTextStyle.text().lg().extrabold().withColor(
          Colors.deepOrange,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: kCircular20Border,
      ),
    
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.zero,
    );
  }
}
