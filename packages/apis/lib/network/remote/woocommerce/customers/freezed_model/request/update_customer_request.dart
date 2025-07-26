// To parse this JSON data, do
//
//     final updateCustomerRequest = updateCustomerRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_customer_request.freezed.dart';
part 'update_customer_request.g.dart';

UpdateCustomerRequest updateCustomerRequestFromJson(String str) =>
    UpdateCustomerRequest.fromJson(json.decode(str));

String updateCustomerRequestToJson(UpdateCustomerRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateCustomerRequest with _$UpdateCustomerRequest {
  const factory UpdateCustomerRequest({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "billing") Billing? billing,
    @JsonKey(name: "shipping") Shipping? shipping,
    @JsonKey(name: "meta_data") List<MetaDatum>? metaData,
  }) = _UpdateCustomerRequest;

  factory UpdateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerRequestFromJson(json);
}

@freezed
class Billing with _$Billing {
  const factory Billing({
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "company") String? company,
    @JsonKey(name: "address_1") String? address1,
    @JsonKey(name: "address_2") String? address2,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
  }) = _Billing;

  factory Billing.fromJson(Map<String, dynamic> json) =>
      _$BillingFromJson(json);
}

@freezed
class MetaDatum with _$MetaDatum {
  const factory MetaDatum({
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "value") String? value,
  }) = _MetaDatum;

  factory MetaDatum.fromJson(Map<String, dynamic> json) =>
      _$MetaDatumFromJson(json);
}

@freezed
class Shipping with _$Shipping {
  const factory Shipping({
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "company") String? company,
    @JsonKey(name: "address_1") String? address1,
    @JsonKey(name: "address_2") String? address2,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "phone") String? phone,
  }) = _Shipping;

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);
}
