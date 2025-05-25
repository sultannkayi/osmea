// To parse this JSON data, do
//
//     final createProductBaseImageResponse = createProductBaseImageResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_base_image_response.freezed.dart';
part 'create_product_base_image_response.g.dart';

CreateProductBaseImageResponse createProductBaseImageResponseFromJson(String str) => CreateProductBaseImageResponse.fromJson(json.decode(str));

String createProductBaseImageResponseToJson(CreateProductBaseImageResponse data) => json.encode(data.toJson());

@freezed
class CreateProductBaseImageResponse with _$CreateProductBaseImageResponse {
    const factory CreateProductBaseImageResponse({
        @JsonKey(name: "product")
        Product? product,
    }) = _CreateProductBaseImageResponse;

    factory CreateProductBaseImageResponse.fromJson(Map<String, dynamic> json) => _$CreateProductBaseImageResponseFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "body_html")
        String? bodyHtml,
        @JsonKey(name: "vendor")
        String? vendor,
        @JsonKey(name: "product_type")
        String? productType,
        @JsonKey(name: "created_at")
        String? createdAt,
        @JsonKey(name: "handle")
        String? handle,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "published_at")
        String? publishedAt,
        @JsonKey(name: "template_suffix")
        dynamic templateSuffix,
        @JsonKey(name: "published_scope")
        String? publishedScope,
        @JsonKey(name: "tags")
        String? tags,
        @JsonKey(name: "status")
        String? status,
        @JsonKey(name: "admin_graphql_api_id")
        String? adminGraphqlApiId,
        @JsonKey(name: "variants")
        List<Variant>? variants,
        @JsonKey(name: "options")
        List<Option>? options,
        @JsonKey(name: "images")
        List<Image>? images,
        @JsonKey(name: "image")
        Image? image,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "alt")
        dynamic alt,
        @JsonKey(name: "position")
        int? position,
        @JsonKey(name: "product_id")
        int? productId,
        @JsonKey(name: "created_at")
        String? createdAt,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "admin_graphql_api_id")
        String? adminGraphqlApiId,
        @JsonKey(name: "width")
        int? width,
        @JsonKey(name: "height")
        int? height,
        @JsonKey(name: "src")
        String? src,
        @JsonKey(name: "variant_ids")
        List<dynamic>? variantIds,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Option with _$Option {
    const factory Option({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "product_id")
        int? productId,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "position")
        int? position,
        @JsonKey(name: "values")
        List<String>? values,
    }) = _Option;

    factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

@freezed
class Variant with _$Variant {
    const factory Variant({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "product_id")
        int? productId,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "price")
        String? price,
        @JsonKey(name: "position")
        int? position,
        @JsonKey(name: "inventory_policy")
        String? inventoryPolicy,
        @JsonKey(name: "compare_at_price")
        dynamic compareAtPrice,
        @JsonKey(name: "option1")
        String? option1,
        @JsonKey(name: "option2")
        dynamic option2,
        @JsonKey(name: "option3")
        dynamic option3,
        @JsonKey(name: "created_at")
        String? createdAt,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "taxable")
        bool? taxable,
        @JsonKey(name: "barcode")
        dynamic barcode,
        @JsonKey(name: "fulfillment_service")
        String? fulfillmentService,
        @JsonKey(name: "grams")
        int? grams,
        @JsonKey(name: "inventory_management")
        dynamic inventoryManagement,
        @JsonKey(name: "requires_shipping")
        bool? requiresShipping,
        @JsonKey(name: "sku")
        String? sku,
        @JsonKey(name: "weight")
        int? weight,
        @JsonKey(name: "weight_unit")
        String? weightUnit,
        @JsonKey(name: "inventory_item_id")
        int? inventoryItemId,
        @JsonKey(name: "inventory_quantity")
        int? inventoryQuantity,
        @JsonKey(name: "old_inventory_quantity")
        int? oldInventoryQuantity,
        @JsonKey(name: "admin_graphql_api_id")
        String? adminGraphqlApiId,
        @JsonKey(name: "image_id")
        dynamic imageId,
    }) = _Variant;

    factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);
}
