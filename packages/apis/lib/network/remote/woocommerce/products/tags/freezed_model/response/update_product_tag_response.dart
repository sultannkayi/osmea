// To parse this JSON data, do
//
//     final updateProductTagResponse = updateProductTagResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_tag_response.freezed.dart';
part 'update_product_tag_response.g.dart';

UpdateProductTagResponse updateProductTagResponseFromJson(String str) =>
    UpdateProductTagResponse.fromJson(json.decode(str));

String updateProductTagResponseToJson(UpdateProductTagResponse data) =>
    json.encode(data.toJson());

@freezed
class UpdateProductTagResponse with _$UpdateProductTagResponse {
  const factory UpdateProductTagResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "_links") Links? links,
  }) = _UpdateProductTagResponse;

  factory UpdateProductTagResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductTagResponseFromJson(json);
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
