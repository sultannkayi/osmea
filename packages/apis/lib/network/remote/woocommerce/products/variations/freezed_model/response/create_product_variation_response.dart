// To parse this JSON data, do
//
//     final createProductVariationResponse = createProductVariationResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_variation_response.freezed.dart';
part 'create_product_variation_response.g.dart';

CreateProductVariationResponse createProductVariationResponseFromJson(
        String str) =>
    CreateProductVariationResponse.fromJson(json.decode(str));

String createProductVariationResponseToJson(
        CreateProductVariationResponse data) =>
    json.encode(data.toJson());

@freezed
class CreateProductVariationResponse with _$CreateProductVariationResponse {
  const factory CreateProductVariationResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "date_created") String? dateCreated,
    @JsonKey(name: "date_created_gmt") String? dateCreatedGmt,
    @JsonKey(name: "date_modified") String? dateModified,
    @JsonKey(name: "date_modified_gmt") String? dateModifiedGmt,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "permalink") String? permalink,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "global_unique_id") String? globalUniqueId,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "regular_price") String? regularPrice,
    @JsonKey(name: "sale_price") String? salePrice,
    @JsonKey(name: "date_on_sale_from") dynamic dateOnSaleFrom,
    @JsonKey(name: "date_on_sale_from_gmt") dynamic dateOnSaleFromGmt,
    @JsonKey(name: "date_on_sale_to") dynamic dateOnSaleTo,
    @JsonKey(name: "date_on_sale_to_gmt") dynamic dateOnSaleToGmt,
    @JsonKey(name: "on_sale") bool? onSale,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "purchasable") bool? purchasable,
    @JsonKey(name: "virtual") bool? virtual,
    @JsonKey(name: "downloadable") bool? downloadable,
    @JsonKey(name: "downloads") List<dynamic>? downloads,
    @JsonKey(name: "download_limit") int? downloadLimit,
    @JsonKey(name: "download_expiry") int? downloadExpiry,
    @JsonKey(name: "tax_status") String? taxStatus,
    @JsonKey(name: "tax_class") String? taxClass,
    @JsonKey(name: "manage_stock") bool? manageStock,
    @JsonKey(name: "stock_quantity") dynamic stockQuantity,
    @JsonKey(name: "stock_status") String? stockStatus,
    @JsonKey(name: "backorders") String? backorders,
    @JsonKey(name: "backorders_allowed") bool? backordersAllowed,
    @JsonKey(name: "backordered") bool? backordered,
    @JsonKey(name: "low_stock_amount") dynamic lowStockAmount,
    @JsonKey(name: "weight") String? weight,
    @JsonKey(name: "dimensions") Dimensions? dimensions,
    @JsonKey(name: "shipping_class") String? shippingClass,
    @JsonKey(name: "shipping_class_id") int? shippingClassId,
    @JsonKey(name: "image") dynamic image,
    @JsonKey(name: "attributes") List<dynamic>? attributes,
    @JsonKey(name: "menu_order") int? menuOrder,
    @JsonKey(name: "meta_data") List<dynamic>? metaData,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "_links") Links? links,
  }) = _CreateProductVariationResponse;

  factory CreateProductVariationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductVariationResponseFromJson(json);
}

@freezed
class Dimensions with _$Dimensions {
  const factory Dimensions({
    @JsonKey(name: "length") String? length,
    @JsonKey(name: "width") String? width,
    @JsonKey(name: "height") String? height,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
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
