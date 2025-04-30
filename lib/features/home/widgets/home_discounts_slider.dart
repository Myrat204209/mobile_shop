// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomeDiscountsSlider extends StatelessWidget {
  const HomeDiscountsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 59 / 109,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return ColoredBox(
              color: Colors.red[100 * (index % 9 + 1)]!,

              child: Align(
                alignment: Alignment.center,
                child: Text(
                  index == 0 ? '%' : '$index',
                  style:
                      index == 0
                          ? AppTextStyle.display().semiBold().withFontSize(150)
                          : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
