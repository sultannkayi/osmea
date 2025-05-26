// To parse this JSON data, do
//
//     final createProductMultiVariantsRequest = createProductMultiVariantsRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_multi_variants_request.freezed.dart';
part 'create_product_multi_variants_request.g.dart';

CreateProductMultiVariantsRequest createProductMultiVariantsRequestFromJson(String str) => CreateProductMultiVariantsRequest.fromJson(json.decode(str));

String createProductMultiVariantsRequestToJson(CreateProductMultiVariantsRequest data) => json.encode(data.toJson());

@freezed
class CreateProductMultiVariantsRequest with _$CreateProductMultiVariantsRequest {
    const factory CreateProductMultiVariantsRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _CreateProductMultiVariantsRequest;

    factory CreateProductMultiVariantsRequest.fromJson(Map<String, dynamic> json) => _$CreateProductMultiVariantsRequestFromJson(json);
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
        @JsonKey(name: "variants")
        List<Variant>? variants,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Variant with _$Variant {
    const factory Variant({
        @JsonKey(name: "option1")
        String? option1,
        @JsonKey(name: "price")
        String? price,
        @JsonKey(name: "sku")
        String? sku,
    }) = _Variant;

    factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);
}
