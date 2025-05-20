// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back),
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.ios_share)),
        IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
      ],
    ).paddingSymmetric(horizontal: 8);
  }
}
