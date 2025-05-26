// To parse this JSON data, do
//
//     final updateProductClearImagesRequest = updateProductClearImagesRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_clear_images_request.freezed.dart';
part 'update_product_clear_images_request.g.dart';

UpdateProductClearImagesRequest updateProductClearImagesRequestFromJson(String str) => UpdateProductClearImagesRequest.fromJson(json.decode(str));

String updateProductClearImagesRequestToJson(UpdateProductClearImagesRequest data) => json.encode(data.toJson());

@freezed
class UpdateProductClearImagesRequest with _$UpdateProductClearImagesRequest {
    const factory UpdateProductClearImagesRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _UpdateProductClearImagesRequest;

    factory UpdateProductClearImagesRequest.fromJson(Map<String, dynamic> json) => _$UpdateProductClearImagesRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "images")
        List<dynamic>? images,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
