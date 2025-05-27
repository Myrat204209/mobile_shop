import 'package:json_annotation/json_annotation.dart';

part 'widget_item.g.dart';

enum WidgetType {
  statusBar,
  clubCard,
  banner,
  recommended,
  carousel,
  category,
  slider,
  bestSeller,
  newArrival,
}

@JsonSerializable(explicitToJson: true)
class WidgetItem {
  final String guid;
  final WidgetType type;
  final int position;
  final DateTime modDate;
  const WidgetItem({
    required this.guid,
    required this.type,
    required this.position,
    required this.modDate,
  });

  factory WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$WidgetItemFromJson(json);
  Map<String, dynamic> toJson() => _$WidgetItemToJson(this);
}
