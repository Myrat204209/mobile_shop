import 'package:json_annotation/json_annotation.dart';

part 'widget_item.g.dart';

@JsonSerializable(explicitToJson: true)
class WidgetItem {
  final String guid;
  final String type;
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

