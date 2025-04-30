import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCategoryGrid extends StatelessWidget {
  const AppCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return ColoredBox(
          color: Colors.red[100 * (index % 9 + 1)]!,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Category $index',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ).paddingAll(10);
      },
    );
  }
}
