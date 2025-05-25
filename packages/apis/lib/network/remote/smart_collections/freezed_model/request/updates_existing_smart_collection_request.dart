// To create this request:
// final updateSmartCollectionRequest = UpdateSmartCollectionRequest(...);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'updates_existing_smart_collection_request.freezed.dart';
part 'updates_existing_smart_collection_request.g.dart';

@freezed
class UpdateSmartCollectionRequest with _$UpdateSmartCollectionRequest {
  const factory UpdateSmartCollectionRequest({
    @JsonKey(name: "smart_collection") SmartCollection? smartCollection,
  }) = _UpdateSmartCollectionRequest;

  factory UpdateSmartCollectionRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSmartCollectionRequestFromJson(json);
}

@freezed
class SmartCollection with _$SmartCollection {
  const factory SmartCollection({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "body_html") String? bodyHtml,
    @JsonKey(name: "sort_order") String? sortOrder,
    @JsonKey(name: "disjunctive") bool? disjunctive,
    @JsonKey(name: "template_suffix") dynamic templateSuffix,
    @JsonKey(name: "handle") String? handle,
    @JsonKey(name: "rules") List<Rule>? rules,
    @JsonKey(name: "published_scope") String? publishedScope,
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