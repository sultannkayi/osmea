// To parse this JSON data, do
//
//     final updateProductReorderVariantsRequest = updateProductReorderVariantsRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_reorder_variants_request.freezed.dart';
part 'update_product_reorder_variants_request.g.dart';

UpdateProductReorderVariantsRequest updateProductReorderVariantsRequestFromJson(String str) => UpdateProductReorderVariantsRequest.fromJson(json.decode(str));

String updateProductReorderVariantsRequestToJson(UpdateProductReorderVariantsRequest data) => json.encode(data.toJson());

@freezed
class UpdateProductReorderVariantsRequest with _$UpdateProductReorderVariantsRequest {
    const factory UpdateProductReorderVariantsRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _UpdateProductReorderVariantsRequest;

    factory UpdateProductReorderVariantsRequest.fromJson(Map<String, dynamic> json) => _$UpdateProductReorderVariantsRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
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
    }) = _Variant;

    factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);
}
