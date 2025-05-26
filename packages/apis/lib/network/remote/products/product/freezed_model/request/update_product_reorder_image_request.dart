// To parse this JSON data, do
//
//     final updateProductReorderImageRequest = updateProductReorderImageRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_reorder_image_request.freezed.dart';
part 'update_product_reorder_image_request.g.dart';

UpdateProductReorderImageRequest updateProductReorderImageRequestFromJson(String str) => UpdateProductReorderImageRequest.fromJson(json.decode(str));

String updateProductReorderImageRequestToJson(UpdateProductReorderImageRequest data) => json.encode(data.toJson());

@freezed
class UpdateProductReorderImageRequest with _$UpdateProductReorderImageRequest {
    const factory UpdateProductReorderImageRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _UpdateProductReorderImageRequest;

    factory UpdateProductReorderImageRequest.fromJson(Map<String, dynamic> json) => _$UpdateProductReorderImageRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "images")
        List<Image>? images,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "position")
        int? position,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
