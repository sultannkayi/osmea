// To parse this JSON data, do
//
//     final addMetafieldToCustomCollectionRequest = addMetafieldToCustomCollectionRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_metafield_to_custom_collection_request.freezed.dart';
part 'add_metafield_to_custom_collection_request.g.dart';

AddMetafieldToCustomCollectionRequest addMetafieldToCustomCollectionRequestFromJson(String str) => AddMetafieldToCustomCollectionRequest.fromJson(json.decode(str));

String addMetafieldToCustomCollectionRequestToJson(AddMetafieldToCustomCollectionRequest data) => json.encode(data.toJson());

@freezed
class AddMetafieldToCustomCollectionRequest with _$AddMetafieldToCustomCollectionRequest {
    const factory AddMetafieldToCustomCollectionRequest({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _AddMetafieldToCustomCollectionRequest;

    factory AddMetafieldToCustomCollectionRequest.fromJson(Map<String, dynamic> json) => _$AddMetafieldToCustomCollectionRequestFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "metafields")
        List<Metafield>? metafields,
    }) = _CustomCollection;

    factory CustomCollection.fromJson(Map<String, dynamic> json) => _$CustomCollectionFromJson(json);
}

@freezed
class Metafield with _$Metafield {
    const factory Metafield({
        @JsonKey(name: "key")
        String? key,
        @JsonKey(name: "value")
        String? value,
        @JsonKey(name: "type")
        String? type,
        @JsonKey(name: "namespace")
        String? namespace,
    }) = _Metafield;

    factory Metafield.fromJson(Map<String, dynamic> json) => _$MetafieldFromJson(json);
}
