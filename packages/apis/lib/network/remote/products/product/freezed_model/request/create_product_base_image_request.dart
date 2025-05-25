// To parse this JSON data, do
//
//     final createProductBaseImageRequest = createProductBaseImageRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_base_image_request.freezed.dart';
part 'create_product_base_image_request.g.dart';

CreateProductBaseImageRequest createProductBaseImageRequestFromJson(String str) => CreateProductBaseImageRequest.fromJson(json.decode(str));

String createProductBaseImageRequestToJson(CreateProductBaseImageRequest data) => json.encode(data.toJson());

@freezed
class CreateProductBaseImageRequest with _$CreateProductBaseImageRequest {
    const factory CreateProductBaseImageRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _CreateProductBaseImageRequest;

    factory CreateProductBaseImageRequest.fromJson(Map<String, dynamic> json) => _$CreateProductBaseImageRequestFromJson(json);
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
        @JsonKey(name: "images")
        List<Image>? images,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "attachment")
        String? attachment,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
