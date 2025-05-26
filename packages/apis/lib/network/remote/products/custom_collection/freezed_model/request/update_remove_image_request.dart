// To parse this JSON data, do
//
//     final updateRemoveImageRequest = updateRemoveImageRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_remove_image_request.freezed.dart';
part 'update_remove_image_request.g.dart';

UpdateRemoveImageRequest updateRemoveImageRequestFromJson(String str) => UpdateRemoveImageRequest.fromJson(json.decode(str));

String updateRemoveImageRequestToJson(UpdateRemoveImageRequest data) => json.encode(data.toJson());

@freezed
class UpdateRemoveImageRequest with _$UpdateRemoveImageRequest {
    const factory UpdateRemoveImageRequest({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _UpdateRemoveImageRequest;

    factory UpdateRemoveImageRequest.fromJson(Map<String, dynamic> json) => _$UpdateRemoveImageRequestFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "image")
        String? image,
        @JsonKey(name: "handle")
        String? handle,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "body_html")
        String? bodyHtml,
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
