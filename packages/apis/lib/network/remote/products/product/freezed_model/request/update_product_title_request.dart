// To parse this JSON data, do
//
//     final updateProductTitleRequest = updateProductTitleRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_title_request.freezed.dart';
part 'update_product_title_request.g.dart';

UpdateProductTitleRequest updateProductTitleRequestFromJson(String str) => UpdateProductTitleRequest.fromJson(json.decode(str));

String updateProductTitleRequestToJson(UpdateProductTitleRequest data) => json.encode(data.toJson());

@freezed
class UpdateProductTitleRequest with _$UpdateProductTitleRequest {
    const factory UpdateProductTitleRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _UpdateProductTitleRequest;

    factory UpdateProductTitleRequest.fromJson(Map<String, dynamic> json) => _$UpdateProductTitleRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "title")
        String? title,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
