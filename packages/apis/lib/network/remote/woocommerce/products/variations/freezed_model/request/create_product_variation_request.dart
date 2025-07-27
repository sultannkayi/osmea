// To parse this JSON data, do
//
//     final createProductVariationRequest = createProductVariationRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_variation_request.freezed.dart';
part 'create_product_variation_request.g.dart';

CreateProductVariationRequest createProductVariationRequestFromJson(
        String str) =>
    CreateProductVariationRequest.fromJson(json.decode(str));

String createProductVariationRequestToJson(
        CreateProductVariationRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateProductVariationRequest with _$CreateProductVariationRequest {
  const factory CreateProductVariationRequest({
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "sku") String? sku,
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
    @JsonKey(name: "weight") String? weight,
    @JsonKey(name: "dimensions") Dimensions? dimensions,
    @JsonKey(name: "shipping_class") String? shippingClass,
    @JsonKey(name: "shipping_class_id") int? shippingClassId,
    @JsonKey(name: "attributes") List<Attribute>? attributes,
    @JsonKey(name: "menu_order") int? menuOrder,
    @JsonKey(name: "meta_data") List<dynamic>? metaData,
  }) = _CreateProductVariationRequest;

  factory CreateProductVariationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductVariationRequestFromJson(json);
}

@freezed
class Attribute with _$Attribute {
  const factory Attribute({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "option") String? option,
  }) = _Attribute;

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);
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
