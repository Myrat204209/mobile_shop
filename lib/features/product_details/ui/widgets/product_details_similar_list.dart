// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ProductDetailsSimilarList extends StatelessWidget {
  const ProductDetailsSimilarList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Похожие товары',
          style: AppTextStyle.text().pageTitleBold(),
        ),
    
        AspectRatio(
          aspectRatio: 45 / 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder:
                (context, index) => AspectRatio(
                  aspectRatio: 10 / 15,
                  child: ProductDetailsCard(
                    product: Product(
                      name: 'name',
                      price: 'asda',
                      imageUrl: 'asad',
                    ),
                    onProductTapped: () {},
                  ),
                ).paddingOnly(right: 10),
          ),
        ),
      ],
    );
  }
}
