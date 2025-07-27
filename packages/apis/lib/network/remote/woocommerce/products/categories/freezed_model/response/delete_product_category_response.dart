// To parse this JSON data, do
//
//     final deleteProductCategoryResponse = deleteProductCategoryResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'delete_product_category_response.freezed.dart';
part 'delete_product_category_response.g.dart';

DeleteProductCategoryResponse deleteProductCategoryResponseFromJson(
        String str) =>
    DeleteProductCategoryResponse.fromJson(json.decode(str));

String deleteProductCategoryResponseToJson(
        DeleteProductCategoryResponse data) =>
    json.encode(data.toJson());

@freezed
class DeleteProductCategoryResponse with _$DeleteProductCategoryResponse {
  const factory DeleteProductCategoryResponse({
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
  }) = _DeleteProductCategoryResponse;

  factory DeleteProductCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProductCategoryResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Collection>? self,
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
