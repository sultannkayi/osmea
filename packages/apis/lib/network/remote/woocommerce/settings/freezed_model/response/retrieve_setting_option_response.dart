// To parse this JSON data, do
//
//     final retrieveSettingOptionResponse = retrieveSettingOptionResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_setting_option_response.freezed.dart';
part 'retrieve_setting_option_response.g.dart';

RetrieveSettingOptionResponse retrieveSettingOptionResponseFromJson(String str) => RetrieveSettingOptionResponse.fromJson(json.decode(str));

String retrieveSettingOptionResponseToJson(RetrieveSettingOptionResponse data) => json.encode(data.toJson());

@freezed
class RetrieveSettingOptionResponse with _$RetrieveSettingOptionResponse {
    const factory RetrieveSettingOptionResponse({
        @JsonKey(name: "id")
        String? id,
        @JsonKey(name: "label")
        String? label,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "type")
        String? type,
        @JsonKey(name: "default")
        String? retrieveSettingOptionResponseDefault,
        @JsonKey(name: "tip")
        String? tip,
        @JsonKey(name: "value")
        String? value,
        @JsonKey(name: "group_id")
        String? groupId,
        @JsonKey(name: "_links")
        Links? links,
    }) = _RetrieveSettingOptionResponse;

    factory RetrieveSettingOptionResponse.fromJson(Map<String, dynamic> json) => _$RetrieveSettingOptionResponseFromJson(json);
}

@freezed
class Links with _$Links {
    const factory Links({
        @JsonKey(name: "self")
        List<Self>? self,
        @JsonKey(name: "collection")
        List<Collection>? collection,
    }) = _Links;

    factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Collection with _$Collection {
    const factory Collection({
        @JsonKey(name: "href")
        String? href,
    }) = _Collection;

    factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}

@freezed
class Self with _$Self {
    const factory Self({
        @JsonKey(name: "href")
        String? href,
        @JsonKey(name: "targetHints")
        TargetHints? targetHints,
    }) = _Self;

    factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
}

@freezed
class TargetHints with _$TargetHints {
    const factory TargetHints({
        @JsonKey(name: "allow")
        List<String>? allow,
    }) = _TargetHints;

    factory TargetHints.fromJson(Map<String, dynamic> json) => _$TargetHintsFromJson(json);
}
