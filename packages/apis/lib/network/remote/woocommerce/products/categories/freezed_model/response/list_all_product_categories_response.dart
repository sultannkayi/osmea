// To parse this JSON data, do
//
//     final listAllProductCategoriesResponse = listAllProductCategoriesResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_product_categories_response.freezed.dart';
part 'list_all_product_categories_response.g.dart';

List<ListAllProductCategoriesResponse> listAllProductCategoriesResponseFromJson(
        String str) =>
    List<ListAllProductCategoriesResponse>.from(json
        .decode(str)
        .map((x) => ListAllProductCategoriesResponse.fromJson(x)));

String listAllProductCategoriesResponseToJson(
        List<ListAllProductCategoriesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllProductCategoriesResponse with _$ListAllProductCategoriesResponse {
  const factory ListAllProductCategoriesResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "parent") int? parent,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "display") String? display,
    @JsonKey(name: "image") dynamic image,
    @JsonKey(name: "menu_order") int? menuOrder,
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllProductCategoriesResponse;

  factory ListAllProductCategoriesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAllProductCategoriesResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
    @JsonKey(name: "up") List<Collection>? up,
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
