// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsRatingRow extends StatelessWidget {
  const ProductDetailsRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.iconColor.withAlpha(10),
        borderRadius: kCircular10Border,
      ),
      child: Row(
        children: [
          Icon(Icons.star_rounded, color: Colors.yellow, size: 35),
          Text('4.3', style: AppTextStyle.text().titleBold()),
          SizedBox(width: 15),
          Icon(Icons.chat_rounded, color: AppColors.iconColor.withAlpha(70)),
          SizedBox(width: 5),
          Text(
            '13 отзывов',
            style: AppTextStyle.text().md().semiBold().withColor(
              AppColors.iconColor.withValues(alpha: 0.7),
            ),
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.mainAccent,
              shape: RoundedRectangleBorder(borderRadius: kCircular15Border),
              side: BorderSide.none,
            ),

            child: Text(
              'Оценыть',
              style: AppTextStyle.text().title().semiBold().withColor(
                Colors.white,
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 5, vertical: 5),
    );
  }
}
