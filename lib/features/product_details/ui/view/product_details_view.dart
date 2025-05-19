// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back),
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.ios_share)),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
            ],
          ).paddingSymmetric(horizontal: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  AspectRatio(aspectRatio: 31 / 32, child: FlutterLogo()),
                  Row(
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
                  ),
                  Text(
                    'Томаты сливочных Круглое лето 600г',
                    style: AppTextStyle.text().xl().bold(),
                  ),
                  SizedBox(height: 40, width: 20).colorize(Colors.red),
                  SizedBox(height: 60, width: 20).colorize(Colors.blue),
                  SizedBox(height: 500, width: 20).colorize(Colors.black),
                ],
              ),
            ).paddingSymmetric(horizontal: 10),
          ),
        ],
      ),
    );
  }
}

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
      ).paddingSymmetric(vertical: 1, horizontal: 8),
    );
  }
}
