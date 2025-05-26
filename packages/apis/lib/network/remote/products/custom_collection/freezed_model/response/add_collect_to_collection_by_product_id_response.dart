// To parse this JSON data, do
//
//     final addCollectToCollectionByProductIdResponse = addCollectToCollectionByProductIdResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_collect_to_collection_by_product_id_response.freezed.dart';
part 'add_collect_to_collection_by_product_id_response.g.dart';

AddCollectToCollectionByProductIdResponse addCollectToCollectionByProductIdResponseFromJson(String str) => AddCollectToCollectionByProductIdResponse.fromJson(json.decode(str));

String addCollectToCollectionByProductIdResponseToJson(AddCollectToCollectionByProductIdResponse data) => json.encode(data.toJson());

@freezed
class AddCollectToCollectionByProductIdResponse with _$AddCollectToCollectionByProductIdResponse {
    const factory AddCollectToCollectionByProductIdResponse({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _AddCollectToCollectionByProductIdResponse;

    factory AddCollectToCollectionByProductIdResponse.fromJson(Map<String, dynamic> json) => _$AddCollectToCollectionByProductIdResponseFromJson(json);
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
