// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomeAdBanner extends StatelessWidget {
  const HomeAdBanner({super.key, this.isBanner = false});
  final bool isBanner;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: 350,
        margin: EdgeInsets.all(15),
        height: !isBanner ? 130 : 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: kCircular10Border,
          color: Colors.deepPurple,
        ),
        alignment: !isBanner ? Alignment.bottomLeft : Alignment.bottomRight,
        child:
            !isBanner
                ? OutlinedButton(
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
                )
                : TextButton(
                  onPressed: () {},
                  child: Text(
                    '👁️ Реклама',
                    style: AppTextStyle.text().description().withColor(
                      Colors.white,
                    ),
                  ),
                ),
      ),
    );
  }
}
