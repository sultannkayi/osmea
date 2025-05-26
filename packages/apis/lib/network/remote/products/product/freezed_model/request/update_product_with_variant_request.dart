// To parse this JSON data, do
//
//     final updateProductWithVariantRequest = updateProductWithVariantRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_with_variant_request.freezed.dart';
part 'update_product_with_variant_request.g.dart';

UpdateProductWithVariantRequest updateProductWithVariantRequestFromJson(String str) => UpdateProductWithVariantRequest.fromJson(json.decode(str));

String updateProductWithVariantRequestToJson(UpdateProductWithVariantRequest data) => json.encode(data.toJson());

@freezed
class UpdateProductWithVariantRequest with _$UpdateProductWithVariantRequest {
    const factory UpdateProductWithVariantRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _UpdateProductWithVariantRequest;

    factory UpdateProductWithVariantRequest.fromJson(Map<String, dynamic> json) => _$UpdateProductWithVariantRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "variants")
        List<Variant>? variants,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Variant with _$Variant {
    const factory Variant({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "price")
        String? price,
        @JsonKey(name: "sku")
        String? sku,
    }) = _Variant;

    factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);
}
