// To parse this JSON data, do
//
//     final retrievesCountOfSmartCollectionsResponse = retrievesCountOfSmartCollectionsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieves_count_of_smart_collections_response.freezed.dart';
part 'retrieves_count_of_smart_collections_response.g.dart';

RetrievesCountOfSmartCollectionsResponse
    retrievesCountOfSmartCollectionsResponseFromJson(String str) =>
        RetrievesCountOfSmartCollectionsResponse.fromJson(json.decode(str));

String retrievesCountOfSmartCollectionsResponseToJson(
        RetrievesCountOfSmartCollectionsResponse data) =>
    json.encode(data.toJson());

@freezed
class RetrievesCountOfSmartCollectionsResponse
    with _$RetrievesCountOfSmartCollectionsResponse {
  const factory RetrievesCountOfSmartCollectionsResponse({
    @JsonKey(name: "count") int? count,
  }) = _RetrievesCountOfSmartCollectionsResponse;

  factory RetrievesCountOfSmartCollectionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RetrievesCountOfSmartCollectionsResponseFromJson(json);
}