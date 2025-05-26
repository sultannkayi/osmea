// To parse this JSON data, do
//
//     final updateProductAddImageRequest = updateProductAddImageRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_add_image_request.freezed.dart';
part 'update_product_add_image_request.g.dart';

UpdateProductAddImageRequest updateProductAddImageRequestFromJson(String str) => UpdateProductAddImageRequest.fromJson(json.decode(str));

String updateProductAddImageRequestToJson(UpdateProductAddImageRequest data) => json.encode(data.toJson());

@freezed
class UpdateProductAddImageRequest with _$UpdateProductAddImageRequest {
    const factory UpdateProductAddImageRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _UpdateProductAddImageRequest;

    factory UpdateProductAddImageRequest.fromJson(Map<String, dynamic> json) => _$UpdateProductAddImageRequestFromJson(json);
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
        @JsonKey(name: "src")
        String? src,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
