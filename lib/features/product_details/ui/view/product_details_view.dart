// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/app/router/router.dart';
import 'package:mobile_shop/features/product_details/product_details.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          appBar: AppBar(
            actionsPadding: EdgeInsets.only(right: 10),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.ios_share)),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
            ],
          ),
          backgroundColor: AppColors.iconColor.withValues(alpha: 0.009),
          body: Column(
            spacing: 10,
            children: [
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
          bottom: 20,
          child: OutlinedButton(
            onPressed: () {
              context.router.push(CartRoute());
            },

            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: kCircular15Border),
              side: BorderSide(color: Colors.transparent),
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
