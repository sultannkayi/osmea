// To parse this JSON data, do
//
//     final updatesExistingSmartCollectionResponse = updatesExistingSmartCollectionResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'updates_existing_smart_collection_response.freezed.dart';
part 'updates_existing_smart_collection_response.g.dart';

UpdatesExistingSmartCollectionResponse
    updatesExistingSmartCollectionResponseFromJson(String str) =>
        UpdatesExistingSmartCollectionResponse.fromJson(json.decode(str));

String updatesExistingSmartCollectionResponseToJson(
        UpdatesExistingSmartCollectionResponse data) =>
    json.encode(data.toJson());

@freezed
class UpdatesExistingSmartCollectionResponse
    with _$UpdatesExistingSmartCollectionResponse {
  const factory UpdatesExistingSmartCollectionResponse({
    @JsonKey(name: "smart_collection") SmartCollection? smartCollection,
  }) = _UpdatesExistingSmartCollectionResponse;

  factory UpdatesExistingSmartCollectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatesExistingSmartCollectionResponseFromJson(json);
}

@freezed
class SmartCollection with _$SmartCollection {
  const factory SmartCollection({
    @JsonKey(name: "body_html") String? bodyHtml,
    @JsonKey(name: "sort_order") String? sortOrder,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "disjunctive") bool? disjunctive,
    @JsonKey(name: "template_suffix") dynamic templateSuffix,
    @JsonKey(name: "handle") String? handle,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "published_at") String? publishedAt,
    @JsonKey(name: "rules") List<Rule>? rules,
    @JsonKey(name: "published_scope") String? publishedScope,
    @JsonKey(name: "admin_graphql_api_id") String? adminGraphqlApiId,
  }) = _SmartCollection;

  factory SmartCollection.fromJson(Map<String, dynamic> json) =>
      _$SmartCollectionFromJson(json);
}

@freezed
class Rule with _$Rule {
  const factory Rule({
    @JsonKey(name: "column") String? column,
    @JsonKey(name: "relation") String? relation,
    @JsonKey(name: "condition") String? condition,
  }) = _Rule;

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);
}