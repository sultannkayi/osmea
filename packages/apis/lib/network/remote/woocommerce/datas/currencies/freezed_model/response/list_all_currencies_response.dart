// To parse this JSON data, do
//
//     final listAllCurrenciesResponse = listAllCurrenciesResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_currencies_response.freezed.dart';
part 'list_all_currencies_response.g.dart';

List<ListAllCurrenciesResponse> listAllCurrenciesResponseFromJson(String str) =>
    List<ListAllCurrenciesResponse>.from(
        json.decode(str).map((x) => ListAllCurrenciesResponse.fromJson(x)));

String listAllCurrenciesResponseToJson(List<ListAllCurrenciesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllCurrenciesResponse with _$ListAllCurrenciesResponse {
  const factory ListAllCurrenciesResponse({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "symbol") String? symbol,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllCurrenciesResponse;

  factory ListAllCurrenciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllCurrenciesResponseFromJson(json);
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
