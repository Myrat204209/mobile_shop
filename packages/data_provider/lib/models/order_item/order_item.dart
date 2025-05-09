// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderItem {
  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'order_number')
  final String orderNumber;

  final String fullName;

  final String address;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'location_id')
  final String? locationId;

  final String? comment;
  @JsonKey(name: 'delivery_date')
  final DateTime deliveryDate;
  final double? discount;
  @JsonKey(name: 'payment_id')
  final int? paymentId;
  @JsonKey(name: 'order_type')
  final String? orderType;
  final bool? paid;
  final String? status;
  @JsonKey(name: 'paid_at')
  final DateTime? paidAt;
  OrderItem({
    required this.id,
    required this.userId,
    required this.orderNumber,
    required this.fullName,
    required this.address,
    required this.phoneNumber,
    required this.deliveryDate,
    this.comment,
    this.locationId,
    this.discount,
    this.paymentId,
    this.orderType,
    this.paid,
    this.status,
    this.paidAt,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
