// To parse this JSON data, do
//
//     final batchUpdateProductTagsResponse = batchUpdateProductTagsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_product_tags_response.freezed.dart';
part 'batch_update_product_tags_response.g.dart';

BatchUpdateProductTagsResponse batchUpdateProductTagsResponseFromJson(String str) => BatchUpdateProductTagsResponse.fromJson(json.decode(str));

String batchUpdateProductTagsResponseToJson(BatchUpdateProductTagsResponse data) => json.encode(data.toJson());

@freezed
class BatchUpdateProductTagsResponse with _$BatchUpdateProductTagsResponse {
    const factory BatchUpdateProductTagsResponse({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Delete>? update,
        @JsonKey(name: "delete")
        List<Delete>? delete,
    }) = _BatchUpdateProductTagsResponse;

    factory BatchUpdateProductTagsResponse.fromJson(Map<String, dynamic> json) => _$BatchUpdateProductTagsResponseFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "count")
        int? count,
        @JsonKey(name: "_links")
        Links? links,
    }) = _Create;

    factory Create.fromJson(Map<String, dynamic> json) => _$CreateFromJson(json);
}

@freezed
class Links with _$Links {
    const factory Links({
        @JsonKey(name: "self")
        List<Self>? self,
        @JsonKey(name: "collection")
        List<Collection>? collection,
    }) = _Links;

    factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Collection with _$Collection {
    const factory Collection({
        @JsonKey(name: "href")
        String? href,
    }) = _Collection;

    factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}

@freezed
class Self with _$Self {
    const factory Self({
        @JsonKey(name: "href")
        String? href,
        @JsonKey(name: "targetHints")
        TargetHints? targetHints,
    }) = _Self;

    factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
}

@freezed
class TargetHints with _$TargetHints {
    const factory TargetHints({
        @JsonKey(name: "allow")
        List<String>? allow,
    }) = _TargetHints;

    factory TargetHints.fromJson(Map<String, dynamic> json) => _$TargetHintsFromJson(json);
}

@freezed
class Delete with _$Delete {
    const factory Delete({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "error")
        Error? error,
    }) = _Delete;

    factory Delete.fromJson(Map<String, dynamic> json) => _$DeleteFromJson(json);
}

@freezed
class Error with _$Error {
    const factory Error({
        @JsonKey(name: "code")
        String? code,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _Error;

    factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "status")
        int? status,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
