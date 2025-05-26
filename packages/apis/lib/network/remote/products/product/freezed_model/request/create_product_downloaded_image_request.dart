// To parse this JSON data, do
//
//     final createProductDownloadedImageRequest = createProductDownloadedImageRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_downloaded_image_request.freezed.dart';
part 'create_product_downloaded_image_request.g.dart';

CreateProductDownloadedImageRequest createProductDownloadedImageRequestFromJson(String str) => CreateProductDownloadedImageRequest.fromJson(json.decode(str));

String createProductDownloadedImageRequestToJson(CreateProductDownloadedImageRequest data) => json.encode(data.toJson());

@freezed
class CreateProductDownloadedImageRequest with _$CreateProductDownloadedImageRequest {
    const factory CreateProductDownloadedImageRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _CreateProductDownloadedImageRequest;

    factory CreateProductDownloadedImageRequest.fromJson(Map<String, dynamic> json) => _$CreateProductDownloadedImageRequestFromJson(json);
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
        @JsonKey(name: "src")
        String? src,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
