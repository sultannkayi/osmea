// To parse this JSON data, do
//
//     final retrieveCountryResponse = retrieveCountryResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_country_response.freezed.dart';
part 'retrieve_country_response.g.dart';

RetrieveCountryResponse retrieveCountryResponseFromJson(String str) =>
    RetrieveCountryResponse.fromJson(json.decode(str));

String retrieveCountryResponseToJson(RetrieveCountryResponse data) =>
    json.encode(data.toJson());

@freezed
class RetrieveCountryResponse with _$RetrieveCountryResponse {
  const factory RetrieveCountryResponse({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "states") List<dynamic>? states,
    @JsonKey(name: "_links") Links? links,
  }) = _RetrieveCountryResponse;

  factory RetrieveCountryResponse.fromJson(Map<String, dynamic> json) =>
      _$RetrieveCountryResponseFromJson(json);
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
