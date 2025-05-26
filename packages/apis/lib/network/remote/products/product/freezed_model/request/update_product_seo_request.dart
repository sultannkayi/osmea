// To parse this JSON data, do
//
//     final updateProductSeoRequest = updateProductSeoRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_seo_request.freezed.dart';
part 'update_product_seo_request.g.dart';

UpdateProductSeoRequest updateProductSeoRequestFromJson(String str) => UpdateProductSeoRequest.fromJson(json.decode(str));

String updateProductSeoRequestToJson(UpdateProductSeoRequest data) => json.encode(data.toJson());

@freezed
class UpdateProductSeoRequest with _$UpdateProductSeoRequest {
    const factory UpdateProductSeoRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _UpdateProductSeoRequest;

    factory UpdateProductSeoRequest.fromJson(Map<String, dynamic> json) => _$UpdateProductSeoRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "metafields_global_title_tag")
        String? metafieldsGlobalTitleTag,
        @JsonKey(name: "metafields_global_description_tag")
        String? metafieldsGlobalDescriptionTag,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
