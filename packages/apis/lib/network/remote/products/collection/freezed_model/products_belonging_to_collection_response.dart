// To parse this JSON data, do
//
//     final productsBelongingToCollectionResponse = productsBelongingToCollectionResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'products_belonging_to_collection_response.freezed.dart';
part 'products_belonging_to_collection_response.g.dart';

ProductsBelongingToCollectionResponse productsBelongingToCollectionResponseFromJson(String str) => ProductsBelongingToCollectionResponse.fromJson(json.decode(str));

String productsBelongingToCollectionResponseToJson(ProductsBelongingToCollectionResponse data) => json.encode(data.toJson());

@freezed
class ProductsBelongingToCollectionResponse with _$ProductsBelongingToCollectionResponse {
    const factory ProductsBelongingToCollectionResponse({
        @JsonKey(name: "products")
        List<Product>? products,
    }) = _ProductsBelongingToCollectionResponse;

    factory ProductsBelongingToCollectionResponse.fromJson(Map<String, dynamic> json) => _$ProductsBelongingToCollectionResponseFromJson(json);
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
        dynamic publishedAt,
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
    }) = _Option;

    factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
