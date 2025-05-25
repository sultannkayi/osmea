// To parse this JSON data, do
//
//     final createSmartCollectionRequest = createSmartCollectionRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_smart_collection_request.freezed.dart';
part 'create_smart_collection_request.g.dart';

CreateSmartCollectionRequest createSmartCollectionRequestFromJson(String str) =>
    CreateSmartCollectionRequest.fromJson(json.decode(str));

String createSmartCollectionRequestToJson(CreateSmartCollectionRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateSmartCollectionRequest with _$CreateSmartCollectionRequest {
  const factory CreateSmartCollectionRequest({
    @JsonKey(name: "smart_collection") SmartCollection? smartCollection,
  }) = _CreateSmartCollectionRequest;

  factory CreateSmartCollectionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSmartCollectionRequestFromJson(json);
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