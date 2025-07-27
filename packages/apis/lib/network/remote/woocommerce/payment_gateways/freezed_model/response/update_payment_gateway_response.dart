// To parse this JSON data, do
//
//     final updatePaymentGatewayResponse = updatePaymentGatewayResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_payment_gateway_response.freezed.dart';
part 'update_payment_gateway_response.g.dart';

UpdatePaymentGatewayResponse updatePaymentGatewayResponseFromJson(String str) =>
    UpdatePaymentGatewayResponse.fromJson(json.decode(str));

String updatePaymentGatewayResponseToJson(UpdatePaymentGatewayResponse data) =>
    json.encode(data.toJson());

@freezed
class UpdatePaymentGatewayResponse with _$UpdatePaymentGatewayResponse {
  const factory UpdatePaymentGatewayResponse({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "order") int? order,
    @JsonKey(name: "enabled") bool? enabled,
    @JsonKey(name: "method_title") String? methodTitle,
    @JsonKey(name: "method_description") String? methodDescription,
    @JsonKey(name: "method_supports") List<String>? methodSupports,
    @JsonKey(name: "settings") Settings? settings,
    @JsonKey(name: "needs_setup") bool? needsSetup,
    @JsonKey(name: "post_install_scripts") List<dynamic>? postInstallScripts,
    @JsonKey(name: "settings_url") String? settingsUrl,
    @JsonKey(name: "connection_url") dynamic connectionUrl,
    @JsonKey(name: "setup_help_text") dynamic setupHelpText,
    @JsonKey(name: "required_settings_keys")
    List<dynamic>? requiredSettingsKeys,
    @JsonKey(name: "_links") Links? links,
  }) = _UpdatePaymentGatewayResponse;

  factory UpdatePaymentGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePaymentGatewayResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
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

@freezed
class Settings with _$Settings {
  const factory Settings({
    @JsonKey(name: "title") Instructions? title,
    @JsonKey(name: "instructions") Instructions? instructions,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

@freezed
class Instructions with _$Instructions {
  const factory Instructions({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "default") String? instructionsDefault,
    @JsonKey(name: "tip") String? tip,
    @JsonKey(name: "placeholder") String? placeholder,
  }) = _Instructions;

  factory Instructions.fromJson(Map<String, dynamic> json) =>
      _$InstructionsFromJson(json);
}
