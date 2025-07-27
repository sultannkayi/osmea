// To parse this JSON data, do
//
//     final createProductAttributeRequest = createProductAttributeRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_attribute_request.freezed.dart';
part 'create_product_attribute_request.g.dart';

CreateProductAttributeRequest createProductAttributeRequestFromJson(
        String str) =>
    CreateProductAttributeRequest.fromJson(json.decode(str));

String createProductAttributeRequestToJson(
        CreateProductAttributeRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateProductAttributeRequest with _$CreateProductAttributeRequest {
  const factory CreateProductAttributeRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "order_by") String? orderBy,
    @JsonKey(name: "has_archives") bool? hasArchives,
  }) = _CreateProductAttributeRequest;

  factory CreateProductAttributeRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductAttributeRequestFromJson(json);
}
