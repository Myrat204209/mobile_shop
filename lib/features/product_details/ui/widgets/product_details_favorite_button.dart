// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsFavoriteButton extends StatelessWidget {
  const ProductDetailsFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: kCircular15Border),
        padding: EdgeInsets.symmetric(vertical: 2),
        side: BorderSide(color: AppColors.majorAccent, width: 2),
      ),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_rounded, color: AppColors.majorAccent, size: 25),
          Text(
            'Выбрать любимым товаром',
            style: AppTextStyle.text().md().lg().semiBold().withColor(
              AppColors.majorAccent,
            ),
          ),
        ],
      ).paddingSymmetric(vertical: 10),
    );
  }
}
