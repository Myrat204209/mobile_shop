import 'package:json_annotation/json_annotation.dart';

import 'widget_item/widget_item.dart';

part 'page_item.g.dart';

enum PageType { main, category, promo }

@JsonSerializable(explicitToJson: true)
class PageItem {
  final PageType pageName;
  final DateTime modDate;
  final List<WidgetItem> widgets;
  const PageItem({
    required this.pageName,
    required this.modDate,
    required this.widgets,
  });

  factory PageItem.fromJson(Map<String, dynamic> json) =>
      _$PageItemFromJson(json);
  Map<String, dynamic> toJson() => _$PageItemToJson(this);
}
