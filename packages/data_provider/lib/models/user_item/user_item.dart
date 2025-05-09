// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_item.g.dart';

@JsonSerializable()
class UserItem {
  final int id;
  final String username;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final int phone;
  final int otp;
  @JsonKey(name: 'role_id')
  final int roleId;
  final String token;
  UserItem({
    required this.id,
    required this.username,
    this.firstName,
    this.lastName,
    required this.phone,
    required this.otp,
    required this.roleId,
    required this.token,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      _$UserItemFromJson(json);
  Map<String, dynamic> toJson() => _$UserItemToJson(this);
}
