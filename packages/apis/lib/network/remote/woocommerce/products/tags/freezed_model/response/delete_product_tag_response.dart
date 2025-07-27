// To parse this JSON data, do
//
//     final deleteProductTagResponse = deleteProductTagResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'delete_product_tag_response.freezed.dart';
part 'delete_product_tag_response.g.dart';

DeleteProductTagResponse deleteProductTagResponseFromJson(String str) =>
    DeleteProductTagResponse.fromJson(json.decode(str));

String deleteProductTagResponseToJson(DeleteProductTagResponse data) =>
    json.encode(data.toJson());

@freezed
class DeleteProductTagResponse with _$DeleteProductTagResponse {
  const factory DeleteProductTagResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "_links") Links? links,
  }) = _DeleteProductTagResponse;

  factory DeleteProductTagResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProductTagResponseFromJson(json);
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
