// To parse this JSON data, do
//
//     final sendOrderDetailsRequest = sendOrderDetailsRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'send_order_details_request.freezed.dart';
part 'send_order_details_request.g.dart';

SendOrderDetailsRequest sendOrderDetailsRequestFromJson(String str) =>
    SendOrderDetailsRequest.fromJson(json.decode(str));

String sendOrderDetailsRequestToJson(SendOrderDetailsRequest data) =>
    json.encode(data.toJson());

@freezed
class SendOrderDetailsRequest with _$SendOrderDetailsRequest {
  const factory SendOrderDetailsRequest({
    @JsonKey(name: "action") String? action,
    @JsonKey(name: "resend_customer_invoice") bool? resendCustomerInvoice,
    @JsonKey(name: "custom_message") String? customMessage,
  }) = _SendOrderDetailsRequest;

  factory SendOrderDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$SendOrderDetailsRequestFromJson(json);
}
