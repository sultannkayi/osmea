// To parse this JSON data, do
//
//     final createProductCategoryRequest = createProductCategoryRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_category_request.freezed.dart';
part 'create_product_category_request.g.dart';

CreateProductCategoryRequest createProductCategoryRequestFromJson(String str) =>
    CreateProductCategoryRequest.fromJson(json.decode(str));

String createProductCategoryRequestToJson(CreateProductCategoryRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateProductCategoryRequest with _$CreateProductCategoryRequest {
  const factory CreateProductCategoryRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "parent") int? parent,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "display") String? display,
  }) = _CreateProductCategoryRequest;

  factory CreateProductCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductCategoryRequestFromJson(json);
}
