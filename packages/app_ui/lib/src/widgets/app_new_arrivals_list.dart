import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppNewArrivalsList extends StatelessWidget {
  const AppNewArrivalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 98 / 95,
        child: Column(
          children: [
            Text('Новинки', style: AppTextStyle.text().extrabold().xl()),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ColoredBox(
                    color: Colors.red[100 * (index % 9 + 1)]!,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'New Arrival $index',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ).colorize(AppColors.mainAccent),
      ),
    );
  }
}
