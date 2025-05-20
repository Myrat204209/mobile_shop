// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsTag extends StatelessWidget {
  const ProductDetailsTag({
    super.key,
    required this.text,
    required this.color,
    this.textColor,
  });
  final String text;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Text(
        text,
        style: AppTextStyle.text().xs().semiBold().withColor(
          textColor ?? Colors.white,
        ),
      ).paddingSymmetric(vertical: 2, horizontal: 8),
    );
  }
}
