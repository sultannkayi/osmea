// To parse this JSON data, do
//
//     final retrieveCurrencyDataResponse = retrieveCurrencyDataResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_currency_data_response.freezed.dart';
part 'retrieve_currency_data_response.g.dart';

RetrieveCurrencyDataResponse retrieveCurrencyDataResponseFromJson(String str) =>
    RetrieveCurrencyDataResponse.fromJson(json.decode(str));

String retrieveCurrencyDataResponseToJson(RetrieveCurrencyDataResponse data) =>
    json.encode(data.toJson());

@freezed
class RetrieveCurrencyDataResponse with _$RetrieveCurrencyDataResponse {
  const factory RetrieveCurrencyDataResponse({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "symbol") String? symbol,
    @JsonKey(name: "_links") Links? links,
  }) = _RetrieveCurrencyDataResponse;

  factory RetrieveCurrencyDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RetrieveCurrencyDataResponseFromJson(json);
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
