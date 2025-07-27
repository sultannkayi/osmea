// To parse this JSON data, do
//
//     final listAllContinentsResponse = listAllContinentsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_continents_response.freezed.dart';
part 'list_all_continents_response.g.dart';

List<ListAllContinentsResponse> listAllContinentsResponseFromJson(String str) =>
    List<ListAllContinentsResponse>.from(
        json.decode(str).map((x) => ListAllContinentsResponse.fromJson(x)));

String listAllContinentsResponseToJson(List<ListAllContinentsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllContinentsResponse with _$ListAllContinentsResponse {
  const factory ListAllContinentsResponse({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "countries") List<Country>? countries,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllContinentsResponse;

  factory ListAllContinentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllContinentsResponseFromJson(json);
}

@freezed
class Country with _$Country {
  const factory Country({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "currency_code") String? currencyCode,
    @JsonKey(name: "currency_pos") String? currencyPos,
    @JsonKey(name: "decimal_sep") String? decimalSep,
    @JsonKey(name: "dimension_unit") String? dimensionUnit,
    @JsonKey(name: "num_decimals") int? numDecimals,
    @JsonKey(name: "thousand_sep") String? thousandSep,
    @JsonKey(name: "weight_unit") String? weightUnit,
    @JsonKey(name: "states") List<State>? states,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class State with _$State {
  const factory State({
    @JsonKey(name: "code") dynamic code,
    @JsonKey(name: "name") String? name,
  }) = _State;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
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
