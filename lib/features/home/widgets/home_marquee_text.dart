// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class HomeMarqueeText extends StatelessWidget {
  const HomeMarqueeText({super.key, this.placemarkText});
  final String? placemarkText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Marquee(
        text: placemarkText ?? 'Москва, Красная площадь, 9',
        style: AppTextStyle.text().medium().withColor(Color(0xFF707578)),
        scrollAxis: Axis.horizontal,

        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 20.0,
        velocity: 100.0,
        pauseAfterRound: Duration(seconds: 1),

        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}
