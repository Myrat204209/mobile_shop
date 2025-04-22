import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomeAdBanner extends StatelessWidget {
  const HomeAdBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: 350,
        margin: EdgeInsets.all(15),
        height: 130,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepPurple,
        ),
        alignment: Alignment.bottomLeft,
        child: OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
          child: Text(
            'Применить',
    
            style: AppTextStyle.text().description().withColor(
              Colors.deepPurple,
            ),
          ),
        ),
      ),
    );
  }
}
