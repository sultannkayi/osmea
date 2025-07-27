// To parse this JSON data, do
//
//     final listAllProductAttributeTermsResponse = listAllProductAttributeTermsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_product_attribute_terms_response.freezed.dart';
part 'list_all_product_attribute_terms_response.g.dart';

List<ListAllProductAttributeTermsResponse>
    listAllProductAttributeTermsResponseFromJson(String str) =>
        List<ListAllProductAttributeTermsResponse>.from(json
            .decode(str)
            .map((x) => ListAllProductAttributeTermsResponse.fromJson(x)));

String listAllProductAttributeTermsResponseToJson(
        List<ListAllProductAttributeTermsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllProductAttributeTermsResponse
    with _$ListAllProductAttributeTermsResponse {
  const factory ListAllProductAttributeTermsResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "menu_order") int? menuOrder,
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllProductAttributeTermsResponse;

  factory ListAllProductAttributeTermsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAllProductAttributeTermsResponseFromJson(json);
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
