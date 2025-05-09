// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@JsonSerializable()
class ProductItem {
  final int id;
  final String name;
  final String? barcode;
  final double price;
  final String? image;
  final String body;
  final int quantity;
  final double discount;
  @JsonKey(name: 'discount_from')
  final DateTime? discountFrom;
  @JsonKey(name: 'discount_to')
  final DateTime? discountTo;
  @JsonKey(name: 'selling_from')
  final DateTime sellingFrom;

  const ProductItem({
    required this.id,
    required this.name,
    required this.price,
    required this.body,
    required this.quantity,
    required this.discount,
    required this.discountFrom,
    required this.discountTo,
    required this.sellingFrom,
    this.barcode,
    this.image,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}
