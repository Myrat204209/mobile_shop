import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: [
                  AspectRatio(aspectRatio: 31 / 32, child: FlutterLogo()),
                  Row(
                    spacing: 10,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.majorAccent,
                        ),
                        child: Text(
                          'asdaasdsd',
                          style: AppTextStyle.text().xs().withColor(
                            Colors.white,
                          ),
                        ).paddingSymmetric(vertical: 1, horizontal: 8),
                      ),
                      ToggleButtons(
                        isSelected: [false, false, true],
                        children: [
                          Text('asdas'),
                          Text('kfjgjkgfkjgf'),
                          Text('uturir'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40, width: 20).colorize(Colors.red),
                  SizedBox(height: 60, width: 20).colorize(Colors.blue),
                  SizedBox(height: 500, width: 20).colorize(Colors.black),
                ],
              ),
            ).paddingSymmetric(horizontal: 10),
          ),
        ],
      ),
    );
  }
}
