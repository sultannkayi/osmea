// To parse this JSON data, do
//
//     final listAllCountriesResponse = listAllCountriesResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_countries_response.freezed.dart';
part 'list_all_countries_response.g.dart';

List<ListAllCountriesResponse> listAllCountriesResponseFromJson(String str) =>
    List<ListAllCountriesResponse>.from(
        json.decode(str).map((x) => ListAllCountriesResponse.fromJson(x)));

String listAllCountriesResponseToJson(List<ListAllCountriesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllCountriesResponse with _$ListAllCountriesResponse {
  const factory ListAllCountriesResponse({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "states") List<State>? states,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllCountriesResponse;

  factory ListAllCountriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllCountriesResponseFromJson(json);
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

@freezed
class State with _$State {
  const factory State({
    @JsonKey(name: "code") dynamic code,
    @JsonKey(name: "name") String? name,
  }) = _State;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
}
