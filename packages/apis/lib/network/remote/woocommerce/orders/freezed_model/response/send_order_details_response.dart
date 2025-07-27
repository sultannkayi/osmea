// To parse this JSON data, do
//
//     final sendOrderDetailsResponse = sendOrderDetailsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'send_order_details_response.freezed.dart';
part 'send_order_details_response.g.dart';

SendOrderDetailsResponse sendOrderDetailsResponseFromJson(String str) =>
    SendOrderDetailsResponse.fromJson(json.decode(str));

String sendOrderDetailsResponseToJson(SendOrderDetailsResponse data) =>
    json.encode(data.toJson());

@freezed
class SendOrderDetailsResponse with _$SendOrderDetailsResponse {
  const factory SendOrderDetailsResponse({
    @JsonKey(name: "message") String? message,
  }) = _SendOrderDetailsResponse;

  factory SendOrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$SendOrderDetailsResponseFromJson(json);
}
