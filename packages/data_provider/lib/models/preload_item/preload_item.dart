import 'package:json_annotation/json_annotation.dart';

part 'preload_item.g.dart';

@JsonSerializable()
class PreloadItem {
  PreloadItem();

  factory PreloadItem.fromJson(Map<String, dynamic> json) =>
      _$PreloadItemFromJson(json);
  Map<String, dynamic> toJson() => _$PreloadItemToJson(this);
}
