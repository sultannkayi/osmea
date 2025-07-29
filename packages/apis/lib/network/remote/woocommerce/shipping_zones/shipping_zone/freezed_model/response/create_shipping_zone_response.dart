// To parse this JSON data, do
//
//     final createShippingZoneResponse = createShippingZoneResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_shipping_zone_response.freezed.dart';
part 'create_shipping_zone_response.g.dart';

CreateShippingZoneResponse createShippingZoneResponseFromJson(String str) =>
    CreateShippingZoneResponse.fromJson(json.decode(str));

String createShippingZoneResponseToJson(CreateShippingZoneResponse data) =>
    json.encode(data.toJson());

@freezed
class CreateShippingZoneResponse with _$CreateShippingZoneResponse {
  const factory CreateShippingZoneResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "order") int? order,
    @JsonKey(name: "_links") Links? links,
  }) = _CreateShippingZoneResponse;

  factory CreateShippingZoneResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateShippingZoneResponseFromJson(json);
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
