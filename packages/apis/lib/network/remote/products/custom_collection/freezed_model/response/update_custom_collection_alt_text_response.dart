// To parse this JSON data, do
//
//     final updateCustomCollectionAltTextResponse = updateCustomCollectionAltTextResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_custom_collection_alt_text_response.freezed.dart';
part 'update_custom_collection_alt_text_response.g.dart';

UpdateCustomCollectionAltTextResponse updateCustomCollectionAltTextResponseFromJson(String str) => UpdateCustomCollectionAltTextResponse.fromJson(json.decode(str));

String updateCustomCollectionAltTextResponseToJson(UpdateCustomCollectionAltTextResponse data) => json.encode(data.toJson());

@freezed
class UpdateCustomCollectionAltTextResponse with _$UpdateCustomCollectionAltTextResponse {
    const factory UpdateCustomCollectionAltTextResponse({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _UpdateCustomCollectionAltTextResponse;

    factory UpdateCustomCollectionAltTextResponse.fromJson(Map<String, dynamic> json) => _$UpdateCustomCollectionAltTextResponseFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "handle")
        String? handle,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "body_html")
        String? bodyHtml,
        @JsonKey(name: "published_at")
        String? publishedAt,
        @JsonKey(name: "sort_order")
        String? sortOrder,
        @JsonKey(name: "template_suffix")
        String? templateSuffix,
        @JsonKey(name: "published_scope")
        String? publishedScope,
        @JsonKey(name: "admin_graphql_api_id")
        String? adminGraphqlApiId,
        @JsonKey(name: "image")
        Image? image,
    }) = _CustomCollection;

    factory CustomCollection.fromJson(Map<String, dynamic> json) => _$CustomCollectionFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "alt")
        String? alt,
        @JsonKey(name: "created_at")
        String? createdAt,
        @JsonKey(name: "width")
        int? width,
        @JsonKey(name: "height")
        int? height,
        @JsonKey(name: "src")
        String? src,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
