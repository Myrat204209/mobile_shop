import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCategoryGrid extends StatelessWidget {
  const AppCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 115,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),

        itemBuilder: (context, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green[100 * (index % 9 + 1)]!,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Category $index',
                style: AppTextStyle.text().bold().lg(),
              ),
            ),
          );
        },
      ),
    );
  }
}
