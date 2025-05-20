// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_advantages_row.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_app_bar.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_favorite_button.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_rating_row.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_similar_list.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
