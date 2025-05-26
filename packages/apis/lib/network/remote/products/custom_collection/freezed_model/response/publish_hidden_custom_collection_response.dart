// To parse this JSON data, do
//
//     final publishHiddenCustomCollectionResponse = publishHiddenCustomCollectionResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'publish_hidden_custom_collection_response.freezed.dart';
part 'publish_hidden_custom_collection_response.g.dart';

PublishHiddenCustomCollectionResponse publishHiddenCustomCollectionResponseFromJson(String str) => PublishHiddenCustomCollectionResponse.fromJson(json.decode(str));

String publishHiddenCustomCollectionResponseToJson(PublishHiddenCustomCollectionResponse data) => json.encode(data.toJson());

@freezed
class PublishHiddenCustomCollectionResponse with _$PublishHiddenCustomCollectionResponse {
    const factory PublishHiddenCustomCollectionResponse({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _PublishHiddenCustomCollectionResponse;

    factory PublishHiddenCustomCollectionResponse.fromJson(Map<String, dynamic> json) => _$PublishHiddenCustomCollectionResponseFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "handle")
        String? handle,
        @JsonKey(name: "body_html")
        String? bodyHtml,
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "updated_at")
        String? updatedAt,
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
