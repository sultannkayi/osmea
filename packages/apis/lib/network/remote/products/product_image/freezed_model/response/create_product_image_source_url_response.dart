// To parse this JSON data, do
//
//     final createProductImageSourceUrlResponse = createProductImageSourceUrlResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_image_source_url_response.freezed.dart';
part 'create_product_image_source_url_response.g.dart';

CreateProductImageSourceUrlResponse createProductImageSourceUrlResponseFromJson(String str) => CreateProductImageSourceUrlResponse.fromJson(json.decode(str));

String createProductImageSourceUrlResponseToJson(CreateProductImageSourceUrlResponse data) => json.encode(data.toJson());

@freezed
class CreateProductImageSourceUrlResponse with _$CreateProductImageSourceUrlResponse {
    const factory CreateProductImageSourceUrlResponse({
        @JsonKey(name: "image")
        Image? image,
    }) = _CreateProductImageSourceUrlResponse;

    factory CreateProductImageSourceUrlResponse.fromJson(Map<String, dynamic> json) => _$CreateProductImageSourceUrlResponseFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "alt")
        String? alt,
        @JsonKey(name: "position")
        int? position,
        @JsonKey(name: "product_id")
        int? productId,
        @JsonKey(name: "created_at")
        String? createdAt,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "admin_graphql_api_id")
        String? adminGraphqlApiId,
        @JsonKey(name: "width")
        int? width,
        @JsonKey(name: "height")
        int? height,
        @JsonKey(name: "src")
        String? src,
        @JsonKey(name: "variant_ids")
        List<dynamic>? variantIds,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
