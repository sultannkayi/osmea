// To parse this JSON data, do
//
//     final singleCollectionResponse = singleCollectionResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'single_collection_response.freezed.dart';
part 'single_collection_response.g.dart';

SingleCollectionResponse singleCollectionResponseFromJson(String str) => SingleCollectionResponse.fromJson(json.decode(str));

String singleCollectionResponseToJson(SingleCollectionResponse data) => json.encode(data.toJson());

@freezed
class SingleCollectionResponse with _$SingleCollectionResponse {
    const factory SingleCollectionResponse({
        @JsonKey(name: "collection")
        Collection? collection,
    }) = _SingleCollectionResponse;

    factory SingleCollectionResponse.fromJson(Map<String, dynamic> json) => _$SingleCollectionResponseFromJson(json);
}

@freezed
class Collection with _$Collection {
    const factory Collection({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "handle")
        String? handle,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "body_html")
        dynamic bodyHtml,
        @JsonKey(name: "published_at")
        String? publishedAt,
        @JsonKey(name: "sort_order")
        String? sortOrder,
        @JsonKey(name: "template_suffix")
        dynamic templateSuffix,
        @JsonKey(name: "products_count")
        int? productsCount,
        @JsonKey(name: "collection_type")
        String? collectionType,
        @JsonKey(name: "published_scope")
        String? publishedScope,
        @JsonKey(name: "admin_graphql_api_id")
        String? adminGraphqlApiId,
    }) = _Collection;

    factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}
