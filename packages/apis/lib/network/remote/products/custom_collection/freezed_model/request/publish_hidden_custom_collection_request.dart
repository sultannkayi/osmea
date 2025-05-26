// To parse this JSON data, do
//
//     final publishHiddenCustomCollectionRequest = publishHiddenCustomCollectionRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'publish_hidden_custom_collection_request.freezed.dart';
part 'publish_hidden_custom_collection_request.g.dart';

PublishHiddenCustomCollectionRequest publishHiddenCustomCollectionRequestFromJson(String str) => PublishHiddenCustomCollectionRequest.fromJson(json.decode(str));

String publishHiddenCustomCollectionRequestToJson(PublishHiddenCustomCollectionRequest data) => json.encode(data.toJson());

@freezed
class PublishHiddenCustomCollectionRequest with _$PublishHiddenCustomCollectionRequest {
    const factory PublishHiddenCustomCollectionRequest({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _PublishHiddenCustomCollectionRequest;

    factory PublishHiddenCustomCollectionRequest.fromJson(Map<String, dynamic> json) => _$PublishHiddenCustomCollectionRequestFromJson(json);
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
