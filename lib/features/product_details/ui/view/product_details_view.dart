// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_favorite_button.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_rating_row.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_similar_list.dart';
import 'package:mobile_shop/features/product_details/ui/widgets/product_details_tag.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  ProductDetailsFavoriteButton(),
                  ProductDetailsRatingRow(),

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
