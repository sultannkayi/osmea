// To parse this JSON data, do
//
//     final updateProductShippingClassRequest = updateProductShippingClassRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_shipping_class_request.freezed.dart';
part 'update_product_shipping_class_request.g.dart';

UpdateProductShippingClassRequest updateProductShippingClassRequestFromJson(
        String str) =>
    UpdateProductShippingClassRequest.fromJson(json.decode(str));

String updateProductShippingClassRequestToJson(
        UpdateProductShippingClassRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateProductShippingClassRequest
    with _$UpdateProductShippingClassRequest {
  const factory UpdateProductShippingClassRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
  }) = _UpdateProductShippingClassRequest;

  factory UpdateProductShippingClassRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateProductShippingClassRequestFromJson(json);
}
