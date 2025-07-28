// To parse this JSON data, do
//
//     final listSettingsGroupsResponse = listSettingsGroupsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_settings_groups_response.freezed.dart';
part 'list_settings_groups_response.g.dart';

List<ListSettingsGroupsResponse> listSettingsGroupsResponseFromJson(String str) => List<ListSettingsGroupsResponse>.from(json.decode(str).map((x) => ListSettingsGroupsResponse.fromJson(x)));

String listSettingsGroupsResponseToJson(List<ListSettingsGroupsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListSettingsGroupsResponse with _$ListSettingsGroupsResponse {
    const factory ListSettingsGroupsResponse({
        @JsonKey(name: "id")
        String? id,
        @JsonKey(name: "label")
        String? label,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "parent_id")
        String? parentId,
        @JsonKey(name: "sub_groups")
        List<String>? subGroups,
        @JsonKey(name: "_links")
        Links? links,
    }) = _ListSettingsGroupsResponse;

    factory ListSettingsGroupsResponse.fromJson(Map<String, dynamic> json) => _$ListSettingsGroupsResponseFromJson(json);
}

@freezed
class Links with _$Links {
    const factory Links({
        @JsonKey(name: "options")
        List<Option>? options,
    }) = _Links;

    factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Option with _$Option {
    const factory Option({
        @JsonKey(name: "href")
        String? href,
    }) = _Option;

    factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
