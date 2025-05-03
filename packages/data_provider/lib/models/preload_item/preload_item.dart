// import 'package:data_provider/models/preload_item/page_item/page_item.dart';
import 'package:json_annotation/json_annotation.dart';

import 'page_item/page_item.dart';

part 'preload_item.g.dart';

@JsonSerializable(explicitToJson: true)
class PreloadItem {
  final String shopName;
  final String shopGuid;
  final DateTime modDate;
  final List<PageItem> pages;
  const PreloadItem({
    required this.shopName,
    required this.shopGuid,
    required this.modDate,
    required this.pages,
  });

  factory PreloadItem.fromJson(Map<String, dynamic> json) =>
      _$PreloadItemFromJson(json);
  Map<String, dynamic> toJson() => _$PreloadItemToJson(this);
}
