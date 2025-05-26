// To parse this JSON data, do
//
//     final updateCustomCollectionAltTextRequest = updateCustomCollectionAltTextRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_custom_collection_alt_text_request.freezed.dart';
part 'update_custom_collection_alt_text_request.g.dart';

UpdateCustomCollectionAltTextRequest updateCustomCollectionAltTextRequestFromJson(String str) => UpdateCustomCollectionAltTextRequest.fromJson(json.decode(str));

String updateCustomCollectionAltTextRequestToJson(UpdateCustomCollectionAltTextRequest data) => json.encode(data.toJson());

@freezed
class UpdateCustomCollectionAltTextRequest with _$UpdateCustomCollectionAltTextRequest {
    const factory UpdateCustomCollectionAltTextRequest({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _UpdateCustomCollectionAltTextRequest;

    factory UpdateCustomCollectionAltTextRequest.fromJson(Map<String, dynamic> json) => _$UpdateCustomCollectionAltTextRequestFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "image")
        Image? image,
    }) = _CustomCollection;

    factory CustomCollection.fromJson(Map<String, dynamic> json) => _$CustomCollectionFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "alt")
        String? alt,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
