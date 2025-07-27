// To parse this JSON data, do
//
//     final createProductRequest = createProductRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_request.freezed.dart';
part 'create_product_request.g.dart';

CreateProductRequest createProductRequestFromJson(String str) =>
    CreateProductRequest.fromJson(json.decode(str));

String createProductRequestToJson(CreateProductRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateProductRequest with _$CreateProductRequest {
  const factory CreateProductRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "regular_price") String? regularPrice,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "short_description") String? shortDescription,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "manage_stock") bool? manageStock,
    @JsonKey(name: "stock_status") String? stockStatus,
    @JsonKey(name: "status") String? status,
  }) = _CreateProductRequest;

  factory CreateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRequestFromJson(json);
}
