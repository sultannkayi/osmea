// To parse this JSON data, do
//
//     final deleteProductAttributeTermResponse = deleteProductAttributeTermResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'delete_product_attribute_term_response.freezed.dart';
part 'delete_product_attribute_term_response.g.dart';

DeleteProductAttributeTermResponse deleteProductAttributeTermResponseFromJson(
        String str) =>
    DeleteProductAttributeTermResponse.fromJson(json.decode(str));

String deleteProductAttributeTermResponseToJson(
        DeleteProductAttributeTermResponse data) =>
    json.encode(data.toJson());

@freezed
class DeleteProductAttributeTermResponse
    with _$DeleteProductAttributeTermResponse {
  const factory DeleteProductAttributeTermResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "menu_order") int? menuOrder,
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "_links") Links? links,
  }) = _DeleteProductAttributeTermResponse;

  factory DeleteProductAttributeTermResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteProductAttributeTermResponseFromJson(json);
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
