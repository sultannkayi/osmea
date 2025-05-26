// To parse this JSON data, do
//
//     final updateCustomCollectionDescriptionResponse = updateCustomCollectionDescriptionResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_custom_collection_description_response.freezed.dart';
part 'update_custom_collection_description_response.g.dart';

UpdateCustomCollectionDescriptionResponse updateCustomCollectionDescriptionResponseFromJson(String str) => UpdateCustomCollectionDescriptionResponse.fromJson(json.decode(str));

String updateCustomCollectionDescriptionResponseToJson(UpdateCustomCollectionDescriptionResponse data) => json.encode(data.toJson());

@freezed
class UpdateCustomCollectionDescriptionResponse with _$UpdateCustomCollectionDescriptionResponse {
    const factory UpdateCustomCollectionDescriptionResponse({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _UpdateCustomCollectionDescriptionResponse;

    factory UpdateCustomCollectionDescriptionResponse.fromJson(Map<String, dynamic> json) => _$UpdateCustomCollectionDescriptionResponseFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "body_html")
        String? bodyHtml,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "handle")
        String? handle,
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "published_at")
        String? publishedAt,
        @JsonKey(name: "sort_order")
        String? sortOrder,
        @JsonKey(name: "template_suffix")
        dynamic templateSuffix,
        @JsonKey(name: "published_scope")
        String? publishedScope,
        @JsonKey(name: "admin_graphql_api_id")
        String? adminGraphqlApiId,
    }) = _CustomCollection;

    factory CustomCollection.fromJson(Map<String, dynamic> json) => _$CustomCollectionFromJson(json);
}
