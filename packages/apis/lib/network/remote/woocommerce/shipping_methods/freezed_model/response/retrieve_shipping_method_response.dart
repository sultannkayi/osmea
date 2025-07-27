// To parse this JSON data, do
//
//     final retrieveShippingMethodResponse = retrieveShippingMethodResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_shipping_method_response.freezed.dart';
part 'retrieve_shipping_method_response.g.dart';

RetrieveShippingMethodResponse retrieveShippingMethodResponseFromJson(
        String str) =>
    RetrieveShippingMethodResponse.fromJson(json.decode(str));

String retrieveShippingMethodResponseToJson(
        RetrieveShippingMethodResponse data) =>
    json.encode(data.toJson());

@freezed
class RetrieveShippingMethodResponse with _$RetrieveShippingMethodResponse {
  const factory RetrieveShippingMethodResponse({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "_links") Links? links,
  }) = _RetrieveShippingMethodResponse;

  factory RetrieveShippingMethodResponse.fromJson(Map<String, dynamic> json) =>
      _$RetrieveShippingMethodResponseFromJson(json);
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
