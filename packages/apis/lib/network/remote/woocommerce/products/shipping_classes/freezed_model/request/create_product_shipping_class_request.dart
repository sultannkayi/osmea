// To parse this JSON data, do
//
//     final createProductShippingClassRequest = createProductShippingClassRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_shipping_class_request.freezed.dart';
part 'create_product_shipping_class_request.g.dart';

CreateProductShippingClassRequest createProductShippingClassRequestFromJson(
        String str) =>
    CreateProductShippingClassRequest.fromJson(json.decode(str));

String createProductShippingClassRequestToJson(
        CreateProductShippingClassRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateProductShippingClassRequest
    with _$CreateProductShippingClassRequest {
  const factory CreateProductShippingClassRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
  }) = _CreateProductShippingClassRequest;

  factory CreateProductShippingClassRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreateProductShippingClassRequestFromJson(json);
}
