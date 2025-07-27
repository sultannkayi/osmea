// To parse this JSON data, do
//
//     final updateProductTagRequest = updateProductTagRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_tag_request.freezed.dart';
part 'update_product_tag_request.g.dart';

UpdateProductTagRequest updateProductTagRequestFromJson(String str) =>
    UpdateProductTagRequest.fromJson(json.decode(str));

String updateProductTagRequestToJson(UpdateProductTagRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateProductTagRequest with _$UpdateProductTagRequest {
  const factory UpdateProductTagRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
  }) = _UpdateProductTagRequest;

  factory UpdateProductTagRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductTagRequestFromJson(json);
}
