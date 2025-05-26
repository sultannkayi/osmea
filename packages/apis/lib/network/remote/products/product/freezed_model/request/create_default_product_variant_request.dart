// To parse this JSON data, do
//
//     final createDefaultProductVariantRequest = createDefaultProductVariantRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_default_product_variant_request.freezed.dart';
part 'create_default_product_variant_request.g.dart';

CreateDefaultProductVariantRequest createDefaultProductVariantRequestFromJson(String str) => CreateDefaultProductVariantRequest.fromJson(json.decode(str));

String createDefaultProductVariantRequestToJson(CreateDefaultProductVariantRequest data) => json.encode(data.toJson());

@freezed
class CreateDefaultProductVariantRequest with _$CreateDefaultProductVariantRequest {
    const factory CreateDefaultProductVariantRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _CreateDefaultProductVariantRequest;

    factory CreateDefaultProductVariantRequest.fromJson(Map<String, dynamic> json) => _$CreateDefaultProductVariantRequestFromJson(json);
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
        @JsonKey(name: "tags")
        List<String>? tags,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
