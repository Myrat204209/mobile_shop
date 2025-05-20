// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/product_details/product_details.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            spacing: 10,
            children: [
              ProductDetailsAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(aspectRatio: 31 / 32, child: FlutterLogo()),
                      ProductDetailsAdvantagesRow(),
                      Text(
                        'Томаты сливочных Круглое лето 600г',
                        style: AppTextStyle.text().xl().bold(),
                      ),
                      ProductDetailsRatingRow(),
                      ProductDetailsFavoriteButton(),

                      ProductDetailsSimilarList(),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 15),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: kCircular10Border),
              backgroundColor: AppColors.mainAccent,
              minimumSize: const Size(350, 50),
            ),
            child: Text(
              'Добавить в корзину',
              style: AppTextStyle.text().withColor(Colors.white),
            ),
          ).paddingSymmetric(horizontal: 15),
        ),
      ],
    );
  }
}
