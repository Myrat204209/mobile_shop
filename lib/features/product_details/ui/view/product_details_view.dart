// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.iconColor.withAlpha(10),
                      borderRadius: kCircular10Border,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.yellow,
                          size: 35,
                        ),
                        Text('4.3', style: AppTextStyle.text().titleBold()),
                        SizedBox(width: 15),
                        Icon(
                          Icons.chat_rounded,
                          color: AppColors.iconColor.withAlpha(70),
                        ),
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
                            shape: RoundedRectangleBorder(
                              borderRadius: kCircular15Border,
                            ),
                            side: BorderSide.none,
                          ),

                          child: Text(
                            'Оценыть',
                            style: AppTextStyle.text()
                                .title()
                                .semiBold()
                                .withColor(Colors.white),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 5, vertical: 5),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      log('asdas');
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: kCircular15Border,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2),
                      side: BorderSide(color: AppColors.majorAccent, width: 2),
                    ),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          color: AppColors.majorAccent,
                          size: 25,
                        ),
                        Text(
                          'Выбрать любимым товаром',
                          style: AppTextStyle.text()
                              .md()
                              .lg()
                              .semiBold()
                              .withColor(AppColors.majorAccent),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),
                  ),
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
              ),
            ).paddingSymmetric(horizontal: 15),
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
      ).paddingSymmetric(vertical: 2, horizontal: 8),
    );
  }
}
