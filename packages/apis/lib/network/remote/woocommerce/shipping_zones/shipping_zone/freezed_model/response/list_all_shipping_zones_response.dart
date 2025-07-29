// To parse this JSON data, do
//
//     final listAllShippingZonesResponse = listAllShippingZonesResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_shipping_zones_response.freezed.dart';
part 'list_all_shipping_zones_response.g.dart';

List<ListAllShippingZonesResponse> listAllShippingZonesResponseFromJson(
        String str) =>
    List<ListAllShippingZonesResponse>.from(
        json.decode(str).map((x) => ListAllShippingZonesResponse.fromJson(x)));

String listAllShippingZonesResponseToJson(
        List<ListAllShippingZonesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllShippingZonesResponse with _$ListAllShippingZonesResponse {
  const factory ListAllShippingZonesResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "order") int? order,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllShippingZonesResponse;

  factory ListAllShippingZonesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllShippingZonesResponseFromJson(json);
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
