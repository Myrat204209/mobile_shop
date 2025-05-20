// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_tag.dart';

class ProductDetailsAdvantagesRow extends StatelessWidget {
  const ProductDetailsAdvantagesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        ProductDetailsTag(
          text: 'asdasd',
          color: AppColors.majorAccent,
        ),
        ProductDetailsTag(
          text: 'kddfkdf',
          textColor: AppColors.majorAccent,
          color: Colors.purpleAccent.shade100.withAlpha(40),
        ),
        ProductDetailsTag(
          text: 'kddfkdf',
          textColor: AppColors.textColor,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}
