// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({super.key, required this.imageUrls});

  final List<String> imageUrls;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 360 / 135,
        child: AnimatedContainer(
          
          duration: const Duration(milliseconds: 300),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: kCircular15Border,
              color: AppColors.majorAccent,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: OutlinedButton(
                onPressed: () {},

                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: kCircular15Border),
                  ),
                ),
                child: Text(
                  'Применить',
                  style: AppTextStyle.text().description().withColor(
                    Colors.deepPurple,
                  ),
                ),
              ),
            ).paddingAll(10),
          ).paddingAll(10),
        ),
      ),
    );
  }
}
