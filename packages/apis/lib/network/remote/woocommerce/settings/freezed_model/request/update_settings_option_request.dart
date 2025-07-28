// To parse this JSON data, do
//
//     final updateSettingsOptionRequest = updateSettingsOptionRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_settings_option_request.freezed.dart';
part 'update_settings_option_request.g.dart';

UpdateSettingsOptionRequest updateSettingsOptionRequestFromJson(String str) => UpdateSettingsOptionRequest.fromJson(json.decode(str));

String updateSettingsOptionRequestToJson(UpdateSettingsOptionRequest data) => json.encode(data.toJson());

@freezed
class UpdateSettingsOptionRequest with _$UpdateSettingsOptionRequest {
    const factory UpdateSettingsOptionRequest({
        @JsonKey(name: "id")
        String? id,
        @JsonKey(name: "label")
        String? label,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "type")
        String? type,
        @JsonKey(name: "default")
        String? updateSettingsOptionRequestDefault,
        @JsonKey(name: "tip")
        String? tip,
        @JsonKey(name: "value")
        String? value,
        @JsonKey(name: "group_id")
        String? groupId,
    }) = _UpdateSettingsOptionRequest;

    factory UpdateSettingsOptionRequest.fromJson(Map<String, dynamic> json) => _$UpdateSettingsOptionRequestFromJson(json);
}
