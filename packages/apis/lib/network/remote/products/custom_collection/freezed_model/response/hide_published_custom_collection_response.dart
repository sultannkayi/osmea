// To parse this JSON data, do
//
//     final hidePublishedCustomCollectionResponse = hidePublishedCustomCollectionResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'hide_published_custom_collection_response.freezed.dart';
part 'hide_published_custom_collection_response.g.dart';

HidePublishedCustomCollectionResponse hidePublishedCustomCollectionResponseFromJson(String str) => HidePublishedCustomCollectionResponse.fromJson(json.decode(str));

String hidePublishedCustomCollectionResponseToJson(HidePublishedCustomCollectionResponse data) => json.encode(data.toJson());

@freezed
class HidePublishedCustomCollectionResponse with _$HidePublishedCustomCollectionResponse {
    const factory HidePublishedCustomCollectionResponse({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _HidePublishedCustomCollectionResponse;

    factory HidePublishedCustomCollectionResponse.fromJson(Map<String, dynamic> json) => _$HidePublishedCustomCollectionResponseFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "handle")
        String? handle,
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "published_at")
        dynamic publishedAt,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "body_html")
        dynamic bodyHtml,
        @JsonKey(name: "sort_order")
        String? sortOrder,
        @JsonKey(name: "template_suffix")
        dynamic templateSuffix,
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
        @JsonKey(name: "created_at")
        String? createdAt,
        @JsonKey(name: "alt")
        String? alt,
        @JsonKey(name: "width")
        int? width,
        @JsonKey(name: "height")
        int? height,
        @JsonKey(name: "src")
        String? src,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
