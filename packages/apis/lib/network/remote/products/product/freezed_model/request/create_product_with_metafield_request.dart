// To parse this JSON data, do
//
//     final createProductWithMetafieldRequest = createProductWithMetafieldRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_with_metafield_request.freezed.dart';
part 'create_product_with_metafield_request.g.dart';

CreateProductWithMetafieldRequest createProductWithMetafieldRequestFromJson(String str) => CreateProductWithMetafieldRequest.fromJson(json.decode(str));

String createProductWithMetafieldRequestToJson(CreateProductWithMetafieldRequest data) => json.encode(data.toJson());

@freezed
class CreateProductWithMetafieldRequest with _$CreateProductWithMetafieldRequest {
    const factory CreateProductWithMetafieldRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _CreateProductWithMetafieldRequest;

    factory CreateProductWithMetafieldRequest.fromJson(Map<String, dynamic> json) => _$CreateProductWithMetafieldRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "body_html")
        String? bodyHtml,
        @JsonKey(name: "vendor")
        String? vendor,
        @JsonKey(name: "product_type")
        String? productType,
        @JsonKey(name: "metafields")
        List<Metafield>? metafields,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Metafield with _$Metafield {
    const factory Metafield({
        @JsonKey(name: "key")
        String? key,
        @JsonKey(name: "value")
        String? value,
        @JsonKey(name: "type")
        String? type,
        @JsonKey(name: "namespace")
        String? namespace,
    }) = _Metafield;

    factory Metafield.fromJson(Map<String, dynamic> json) => _$MetafieldFromJson(json);
}
