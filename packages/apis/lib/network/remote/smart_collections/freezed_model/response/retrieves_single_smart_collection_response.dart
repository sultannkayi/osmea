// To parse this JSON data, do
//
//     final retrievesSingleSmartCollectionsResponse = retrievesSingleSmartCollectionsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieves_single_smart_collection_response.freezed.dart';
part 'retrieves_single_smart_collection_response.g.dart';

RetrievesSingleSmartCollectionsResponse
    retrievesSingleSmartCollectionsResponseFromJson(String str) =>
        RetrievesSingleSmartCollectionsResponse.fromJson(json.decode(str));

String retrievesSingleSmartCollectionsResponseToJson(
        RetrievesSingleSmartCollectionsResponse data) =>
    json.encode(data.toJson());

@freezed
class RetrievesSingleSmartCollectionsResponse
    with _$RetrievesSingleSmartCollectionsResponse {
  const factory RetrievesSingleSmartCollectionsResponse({
    @JsonKey(name: "smart_collection") SmartCollection? smartCollection,
  }) = _RetrievesSingleSmartCollectionsResponse;

  factory RetrievesSingleSmartCollectionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RetrievesSingleSmartCollectionsResponseFromJson(json);
}

@freezed
class SmartCollection with _$SmartCollection {
  const factory SmartCollection({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "handle") String? handle,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "body_html") dynamic bodyHtml,
    @JsonKey(name: "published_at") String? publishedAt,
    @JsonKey(name: "sort_order") String? sortOrder,
    @JsonKey(name: "template_suffix") dynamic templateSuffix,
    @JsonKey(name: "products_count") int? productsCount,
    @JsonKey(name: "disjunctive") bool? disjunctive,
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