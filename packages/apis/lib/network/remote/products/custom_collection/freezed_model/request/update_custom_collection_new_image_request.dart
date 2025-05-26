// To parse this JSON data, do
//
//     final updateCustomCollectionNewImageRequest = updateCustomCollectionNewImageRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_custom_collection_new_image_request.freezed.dart';
part 'update_custom_collection_new_image_request.g.dart';

UpdateCustomCollectionNewImageRequest updateCustomCollectionNewImageRequestFromJson(String str) => UpdateCustomCollectionNewImageRequest.fromJson(json.decode(str));

String updateCustomCollectionNewImageRequestToJson(UpdateCustomCollectionNewImageRequest data) => json.encode(data.toJson());

@freezed
class UpdateCustomCollectionNewImageRequest with _$UpdateCustomCollectionNewImageRequest {
    const factory UpdateCustomCollectionNewImageRequest({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _UpdateCustomCollectionNewImageRequest;

    factory UpdateCustomCollectionNewImageRequest.fromJson(Map<String, dynamic> json) => _$UpdateCustomCollectionNewImageRequestFromJson(json);
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
        @JsonKey(name: "attachment")
        String? attachment,
        @JsonKey(name: "alt")
        String? alt,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
