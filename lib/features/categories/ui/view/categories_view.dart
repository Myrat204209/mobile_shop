// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/core/core.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.pageItem});

  final PageItem pageItem;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => PageLayout(widgets: pageItem.widgets),
    );
  }
}
