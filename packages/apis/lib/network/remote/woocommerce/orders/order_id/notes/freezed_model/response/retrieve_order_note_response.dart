// To parse this JSON data, do
//
//     final retrieveOrderNoteResponse = retrieveOrderNoteResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_order_note_response.freezed.dart';
part 'retrieve_order_note_response.g.dart';

List<RetrieveOrderNoteResponse> retrieveOrderNoteResponseFromJson(String str) =>
    List<RetrieveOrderNoteResponse>.from(
        json.decode(str).map((x) => RetrieveOrderNoteResponse.fromJson(x)));

String retrieveOrderNoteResponseToJson(List<RetrieveOrderNoteResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class RetrieveOrderNoteResponse with _$RetrieveOrderNoteResponse {
  const factory RetrieveOrderNoteResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "author") String? author,
    @JsonKey(name: "date_created") String? dateCreated,
    @JsonKey(name: "date_created_gmt") String? dateCreatedGmt,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "customer_note") bool? customerNote,
    @JsonKey(name: "_links") Links? links,
  }) = _RetrieveOrderNoteResponse;

  factory RetrieveOrderNoteResponse.fromJson(Map<String, dynamic> json) =>
      _$RetrieveOrderNoteResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
    @JsonKey(name: "up") List<Collection>? up,
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
