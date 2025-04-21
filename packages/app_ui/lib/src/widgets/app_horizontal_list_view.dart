// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'dart:math' as math;

import 'package:flutter/material.dart';

/// App horizontal list view seperated
class AppHorizontalListView extends StatelessWidget {
  /// Constructor
  const AppHorizontalListView({
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.separatorBuilder,
    this.padding,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    super.key,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final ScrollController? controller;
  final EdgeInsets? padding;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    /// get actual child count
    final actualChildCount = _computeActualChildCount(itemCount);

    /// generate indexes
    final indexes = List.generate(actualChildCount, (i) => i);

    /// prepare children
    final children = indexes.map<Widget>((index) {
      final itemIndex = index ~/ 2;

      if (index.isEven) {
        return itemBuilder(context, itemIndex);
      }

      return separatorBuilder == null
          ? const SizedBox.shrink()
          : separatorBuilder!(context, itemIndex);
    }).toList();

    /// use single child scroll view with row to remove error listview horizontal ":hasSize"
    return SingleChildScrollView(
      controller: controller,
      padding: padding,
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  // Helper method to compute the actual child count for the separated constructor.
  static int _computeActualChildCount(int itemCount) {
    return math.max(0, itemCount * 2 - 1);
  }
}
