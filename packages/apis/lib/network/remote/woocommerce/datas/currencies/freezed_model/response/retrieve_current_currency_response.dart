// To parse this JSON data, do
//
//     final retrieveCurrentCurrencyResponse = retrieveCurrentCurrencyResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_current_currency_response.freezed.dart';
part 'retrieve_current_currency_response.g.dart';

RetrieveCurrentCurrencyResponse retrieveCurrentCurrencyResponseFromJson(
        String str) =>
    RetrieveCurrentCurrencyResponse.fromJson(json.decode(str));

String retrieveCurrentCurrencyResponseToJson(
        RetrieveCurrentCurrencyResponse data) =>
    json.encode(data.toJson());

@freezed
class RetrieveCurrentCurrencyResponse with _$RetrieveCurrentCurrencyResponse {
  const factory RetrieveCurrentCurrencyResponse({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "symbol") String? symbol,
    @JsonKey(name: "_links") Links? links,
  }) = _RetrieveCurrentCurrencyResponse;

  factory RetrieveCurrentCurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$RetrieveCurrentCurrencyResponseFromJson(json);
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
