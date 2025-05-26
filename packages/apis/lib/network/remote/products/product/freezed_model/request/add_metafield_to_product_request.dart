// To parse this JSON data, do
//
//     final addMetafieldToProductRequest = addMetafieldToProductRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_metafield_to_product_request.freezed.dart';
part 'add_metafield_to_product_request.g.dart';

AddMetafieldToProductRequest addMetafieldToProductRequestFromJson(String str) => AddMetafieldToProductRequest.fromJson(json.decode(str));

String addMetafieldToProductRequestToJson(AddMetafieldToProductRequest data) => json.encode(data.toJson());

@freezed
class AddMetafieldToProductRequest with _$AddMetafieldToProductRequest {
    const factory AddMetafieldToProductRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _AddMetafieldToProductRequest;

    factory AddMetafieldToProductRequest.fromJson(Map<String, dynamic> json) => _$AddMetafieldToProductRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
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
        @JsonKey(name: "value_type")
        String? valueType,
        @JsonKey(name: "namespace")
        String? namespace,
    }) = _Metafield;

    factory Metafield.fromJson(Map<String, dynamic> json) => _$MetafieldFromJson(json);
}
