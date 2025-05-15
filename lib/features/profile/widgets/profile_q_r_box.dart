import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProfileQRBox extends StatelessWidget {
  const ProfileQRBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: kCircular10Border,
          color: AppColors.bgMain,
        ),
      ),
    );
  }
}
