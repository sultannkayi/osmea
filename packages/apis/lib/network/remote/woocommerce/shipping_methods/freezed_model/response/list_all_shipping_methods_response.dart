// To parse this JSON data, do
//
//     final listAllShippingMethodsResponse = listAllShippingMethodsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_shipping_methods_response.freezed.dart';
part 'list_all_shipping_methods_response.g.dart';

List<ListAllShippingMethodsResponse> listAllShippingMethodsResponseFromJson(
        String str) =>
    List<ListAllShippingMethodsResponse>.from(json
        .decode(str)
        .map((x) => ListAllShippingMethodsResponse.fromJson(x)));

String listAllShippingMethodsResponseToJson(
        List<ListAllShippingMethodsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllShippingMethodsResponse with _$ListAllShippingMethodsResponse {
  const factory ListAllShippingMethodsResponse({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllShippingMethodsResponse;

  factory ListAllShippingMethodsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllShippingMethodsResponseFromJson(json);
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
