import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_email_address_request.freezed.dart';
part 'update_email_address_request.g.dart';

UpdateEmailAddressRequest updateEmailAddressRequestFromJson(String str) =>
    UpdateEmailAddressRequest.fromJson(json.decode(str));

String updateEmailAddressRequestToJson(UpdateEmailAddressRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateEmailAddressRequest with _$UpdateEmailAddressRequest {
  const factory UpdateEmailAddressRequest({
    @JsonKey(name: "order") Order? order,
  }) = _UpdateEmailAddressRequest;

  factory UpdateEmailAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailAddressRequestFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    @JsonKey(name: "email") String? email,
    int? id,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
