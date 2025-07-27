// To parse this JSON data, do
//
//     final createProductTagRequest = createProductTagRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_tag_request.freezed.dart';
part 'create_product_tag_request.g.dart';

CreateProductTagRequest createProductTagRequestFromJson(String str) =>
    CreateProductTagRequest.fromJson(json.decode(str));

String createProductTagRequestToJson(CreateProductTagRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateProductTagRequest with _$CreateProductTagRequest {
  const factory CreateProductTagRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
  }) = _CreateProductTagRequest;

  factory CreateProductTagRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductTagRequestFromJson(json);
}
