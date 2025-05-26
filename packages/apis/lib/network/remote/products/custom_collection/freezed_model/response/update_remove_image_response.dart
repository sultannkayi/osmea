// To parse this JSON data, do
//
//     final updateRemoveImageResponse = updateRemoveImageResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_remove_image_response.freezed.dart';
part 'update_remove_image_response.g.dart';

UpdateRemoveImageResponse updateRemoveImageResponseFromJson(String str) => UpdateRemoveImageResponse.fromJson(json.decode(str));

String updateRemoveImageResponseToJson(UpdateRemoveImageResponse data) => json.encode(data.toJson());

@freezed
class UpdateRemoveImageResponse with _$UpdateRemoveImageResponse {
    const factory UpdateRemoveImageResponse({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _UpdateRemoveImageResponse;

    factory UpdateRemoveImageResponse.fromJson(Map<String, dynamic> json) => _$UpdateRemoveImageResponseFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "body_html")
        String? bodyHtml,
        @JsonKey(name: "handle")
        String? handle,
        @JsonKey(name: "sort_order")
        String? sortOrder,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "template_suffix")
        dynamic templateSuffix,
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "published_at")
        String? publishedAt,
        @JsonKey(name: "published_scope")
        String? publishedScope,
        @JsonKey(name: "admin_graphql_api_id")
        String? adminGraphqlApiId,
    }) = _CustomCollection;

    factory CustomCollection.fromJson(Map<String, dynamic> json) => _$CustomCollectionFromJson(json);
}
