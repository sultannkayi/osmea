// To parse this JSON data, do
//
//     final hidePublishedCustomCollectionRequest = hidePublishedCustomCollectionRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'hide_published_custom_collection_request.freezed.dart';
part 'hide_published_custom_collection_request.g.dart';

HidePublishedCustomCollectionRequest hidePublishedCustomCollectionRequestFromJson(String str) => HidePublishedCustomCollectionRequest.fromJson(json.decode(str));

String hidePublishedCustomCollectionRequestToJson(HidePublishedCustomCollectionRequest data) => json.encode(data.toJson());

@freezed
class HidePublishedCustomCollectionRequest with _$HidePublishedCustomCollectionRequest {
    const factory HidePublishedCustomCollectionRequest({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _HidePublishedCustomCollectionRequest;

    factory HidePublishedCustomCollectionRequest.fromJson(Map<String, dynamic> json) => _$HidePublishedCustomCollectionRequestFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "published")
        bool? published,
    }) = _CustomCollection;

    factory CustomCollection.fromJson(Map<String, dynamic> json) => _$CustomCollectionFromJson(json);
}
