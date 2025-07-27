// To parse this JSON data, do
//
//     final createProductAttributeResponse = createProductAttributeResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_attribute_response.freezed.dart';
part 'create_product_attribute_response.g.dart';

CreateProductAttributeResponse createProductAttributeResponseFromJson(
        String str) =>
    CreateProductAttributeResponse.fromJson(json.decode(str));

String createProductAttributeResponseToJson(
        CreateProductAttributeResponse data) =>
    json.encode(data.toJson());

@freezed
class CreateProductAttributeResponse with _$CreateProductAttributeResponse {
  const factory CreateProductAttributeResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "order_by") String? orderBy,
    @JsonKey(name: "has_archives") bool? hasArchives,
    @JsonKey(name: "_links") Links? links,
  }) = _CreateProductAttributeResponse;

  factory CreateProductAttributeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductAttributeResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Collection with _$Collection {
  const factory Collection({
    @JsonKey(name: "href") String? href,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}

@freezed
class Self with _$Self {
  const factory Self({
    @JsonKey(name: "href") String? href,
    @JsonKey(name: "targetHints") TargetHints? targetHints,
  }) = _Self;

  factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
}

@freezed
class TargetHints with _$TargetHints {
  const factory TargetHints({
    @JsonKey(name: "allow") List<String>? allow,
  }) = _TargetHints;

  factory TargetHints.fromJson(Map<String, dynamic> json) =>
      _$TargetHintsFromJson(json);
}
