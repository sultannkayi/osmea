// To parse this JSON data, do
//
//     final showHiddenProductRequest = showHiddenProductRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'show_hidden_product_request.freezed.dart';
part 'show_hidden_product_request.g.dart';

ShowHiddenProductRequest showHiddenProductRequestFromJson(String str) => ShowHiddenProductRequest.fromJson(json.decode(str));

String showHiddenProductRequestToJson(ShowHiddenProductRequest data) => json.encode(data.toJson());

@freezed
class ShowHiddenProductRequest with _$ShowHiddenProductRequest {
    const factory ShowHiddenProductRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _ShowHiddenProductRequest;

    factory ShowHiddenProductRequest.fromJson(Map<String, dynamic> json) => _$ShowHiddenProductRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "published")
        bool? published,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
