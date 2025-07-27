// To parse this JSON data, do
//
//     final deleteProductShippingClassResponse = deleteProductShippingClassResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'delete_product_shipping_class_response.freezed.dart';
part 'delete_product_shipping_class_response.g.dart';

DeleteProductShippingClassResponse deleteProductShippingClassResponseFromJson(
        String str) =>
    DeleteProductShippingClassResponse.fromJson(json.decode(str));

String deleteProductShippingClassResponseToJson(
        DeleteProductShippingClassResponse data) =>
    json.encode(data.toJson());

@freezed
class DeleteProductShippingClassResponse
    with _$DeleteProductShippingClassResponse {
  const factory DeleteProductShippingClassResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "count") int? count,
    @JsonKey(name: "_links") Links? links,
  }) = _DeleteProductShippingClassResponse;

  factory DeleteProductShippingClassResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteProductShippingClassResponseFromJson(json);
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
