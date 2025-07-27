// To parse this JSON data, do
//
//     final listAllReportsResponse = listAllReportsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_reports_response.freezed.dart';
part 'list_all_reports_response.g.dart';

List<ListAllReportsResponse> listAllReportsResponseFromJson(String str) => List<ListAllReportsResponse>.from(json.decode(str).map((x) => ListAllReportsResponse.fromJson(x)));

String listAllReportsResponseToJson(List<ListAllReportsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllReportsResponse with _$ListAllReportsResponse {
    const factory ListAllReportsResponse({
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "_links")
        Links? links,
    }) = _ListAllReportsResponse;

    factory ListAllReportsResponse.fromJson(Map<String, dynamic> json) => _$ListAllReportsResponseFromJson(json);
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
