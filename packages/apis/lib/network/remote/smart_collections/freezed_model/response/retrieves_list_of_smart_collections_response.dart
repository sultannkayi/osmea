// To parse this JSON data, do
//
//     final retrievesListOfSmartCollectionsResponse = retrievesListOfSmartCollectionsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieves_list_of_smart_collections_response.freezed.dart';
part 'retrieves_list_of_smart_collections_response.g.dart';

RetrievesListOfSmartCollectionsResponse retrievesListOfSmartCollectionsResponseFromJson(String str) => RetrievesListOfSmartCollectionsResponse.fromJson(json.decode(str));

String retrievesListOfSmartCollectionsResponseToJson(RetrievesListOfSmartCollectionsResponse data) => json.encode(data.toJson());

@freezed
class RetrievesListOfSmartCollectionsResponse with _$RetrievesListOfSmartCollectionsResponse {
    const factory RetrievesListOfSmartCollectionsResponse({
        @JsonKey(name: "smart_collections")
        List<SmartCollection>? smartCollections,
    }) = _RetrievesListOfSmartCollectionsResponse;

    factory RetrievesListOfSmartCollectionsResponse.fromJson(Map<String, dynamic> json) => _$RetrievesListOfSmartCollectionsResponseFromJson(json);
}

@freezed
class SmartCollection with _$SmartCollection {
    const factory SmartCollection({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "handle")
        String? handle,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "updated_at")
        String? updatedAt,
        @JsonKey(name: "body_html")
        dynamic bodyHtml,
        @JsonKey(name: "published_at")
        String? publishedAt,
        @JsonKey(name: "sort_order")
        String? sortOrder,
        @JsonKey(name: "template_suffix")
        dynamic templateSuffix,
        @JsonKey(name: "disjunctive")
        bool? disjunctive,
        @JsonKey(name: "rules")
        List<Rule>? rules,
        @JsonKey(name: "published_scope")
        String? publishedScope,
        @JsonKey(name: "admin_graphql_api_id")
        String? adminGraphqlApiId,
        @JsonKey(name: "image")
        Image? image,
    }) = _SmartCollection;

    factory SmartCollection.fromJson(Map<String, dynamic> json) => _$SmartCollectionFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "created_at")
        String? createdAt,
        @JsonKey(name: "alt")
        String? alt,
        @JsonKey(name: "width")
        int? width,
        @JsonKey(name: "height")
        int? height,
        @JsonKey(name: "src")
        String? src,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Rule with _$Rule {
    const factory Rule({
        @JsonKey(name: "column")
        String? column,
        @JsonKey(name: "relation")
        String? relation,
        @JsonKey(name: "condition")
        String? condition,
    }) = _Rule;

    factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);
}
