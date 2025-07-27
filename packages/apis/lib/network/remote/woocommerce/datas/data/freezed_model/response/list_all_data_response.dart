// To parse this JSON data, do
//
//     final listAllDataResponse = listAllDataResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_data_response.freezed.dart';
part 'list_all_data_response.g.dart';

List<ListAllDataResponse> listAllDataResponseFromJson(String str) =>
    List<ListAllDataResponse>.from(
        json.decode(str).map((x) => ListAllDataResponse.fromJson(x)));

String listAllDataResponseToJson(List<ListAllDataResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllDataResponse with _$ListAllDataResponse {
  const factory ListAllDataResponse({
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllDataResponse;

  factory ListAllDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllDataResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Collection with _$Collection {
  const factory Collection({
    @JsonKey(name: "href") String? href,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}

@freezed
class Self with _$Self {
  const factory Self({
    @JsonKey(name: "href") String? href,
    @JsonKey(name: "targetHints") TargetHints? targetHints,
  }) = _Self;

  factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
}

@freezed
class TargetHints with _$TargetHints {
  const factory TargetHints({
    @JsonKey(name: "allow") List<String>? allow,
  }) = _TargetHints;

  factory TargetHints.fromJson(Map<String, dynamic> json) =>
      _$TargetHintsFromJson(json);
}
