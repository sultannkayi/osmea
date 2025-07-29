// To parse this JSON data, do
//
//     final retrieveShippingZoneLocationResponse = retrieveShippingZoneLocationResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_shipping_zone_location_response.freezed.dart';
part 'retrieve_shipping_zone_location_response.g.dart';

RetrieveShippingZoneLocationResponse
    retrieveShippingZoneLocationResponseFromJson(String str) =>
        RetrieveShippingZoneLocationResponse.fromJson(json.decode(str));

String retrieveShippingZoneLocationResponseToJson(
        RetrieveShippingZoneLocationResponse data) =>
    json.encode(data.toJson());

@freezed
class RetrieveShippingZoneLocationResponse
    with _$RetrieveShippingZoneLocationResponse {
  const factory RetrieveShippingZoneLocationResponse({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "_links") Links? links,
  }) = _RetrieveShippingZoneLocationResponse;

  factory RetrieveShippingZoneLocationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RetrieveShippingZoneLocationResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
    @JsonKey(name: "describedby") List<Collection>? describedby,
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
