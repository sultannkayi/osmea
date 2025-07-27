// To parse this JSON data, do
//
//     final createProductAttributeTermRequest = createProductAttributeTermRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_attribute_term_request.freezed.dart';
part 'create_product_attribute_term_request.g.dart';

CreateProductAttributeTermRequest createProductAttributeTermRequestFromJson(
        String str) =>
    CreateProductAttributeTermRequest.fromJson(json.decode(str));

String createProductAttributeTermRequestToJson(
        CreateProductAttributeTermRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateProductAttributeTermRequest
    with _$CreateProductAttributeTermRequest {
  const factory CreateProductAttributeTermRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "menu_order") int? menuOrder,
  }) = _CreateProductAttributeTermRequest;

  factory CreateProductAttributeTermRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreateProductAttributeTermRequestFromJson(json);
}
