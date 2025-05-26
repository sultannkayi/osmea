// To parse this JSON data, do
//
//     final updateCustomCollectionDescriptionRequest = updateCustomCollectionDescriptionRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_custom_collection_description_request.freezed.dart';
part 'update_custom_collection_description_request.g.dart';

UpdateCustomCollectionDescriptionRequest updateCustomCollectionDescriptionRequestFromJson(String str) => UpdateCustomCollectionDescriptionRequest.fromJson(json.decode(str));

String updateCustomCollectionDescriptionRequestToJson(UpdateCustomCollectionDescriptionRequest data) => json.encode(data.toJson());

@freezed
class UpdateCustomCollectionDescriptionRequest with _$UpdateCustomCollectionDescriptionRequest {
    const factory UpdateCustomCollectionDescriptionRequest({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _UpdateCustomCollectionDescriptionRequest;

    factory UpdateCustomCollectionDescriptionRequest.fromJson(Map<String, dynamic> json) => _$UpdateCustomCollectionDescriptionRequestFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "body_html")
        String? bodyHtml,
    }) = _CustomCollection;

    factory CustomCollection.fromJson(Map<String, dynamic> json) => _$CustomCollectionFromJson(json);
}
