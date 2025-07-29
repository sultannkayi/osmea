// To parse this JSON data, do
//
//     final includeShippingMethodToShippingZoneResponse = includeShippingMethodToShippingZoneResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'include_shipping_method_to_shipping_zone_response.freezed.dart';
part 'include_shipping_method_to_shipping_zone_response.g.dart';

IncludeShippingMethodToShippingZoneResponse
    includeShippingMethodToShippingZoneResponseFromJson(String str) =>
        IncludeShippingMethodToShippingZoneResponse.fromJson(json.decode(str));

String includeShippingMethodToShippingZoneResponseToJson(
        IncludeShippingMethodToShippingZoneResponse data) =>
    json.encode(data.toJson());

@freezed
class IncludeShippingMethodToShippingZoneResponse
    with _$IncludeShippingMethodToShippingZoneResponse {
  const factory IncludeShippingMethodToShippingZoneResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "instance_id") int? instanceId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "order") int? order,
    @JsonKey(name: "enabled") bool? enabled,
    @JsonKey(name: "method_id") String? methodId,
    @JsonKey(name: "method_title") String? methodTitle,
    @JsonKey(name: "method_description") String? methodDescription,
    @JsonKey(name: "settings") Settings? settings,
    @JsonKey(name: "_links") Links? links,
  }) = _IncludeShippingMethodToShippingZoneResponse;

  factory IncludeShippingMethodToShippingZoneResponse.fromJson(
          Map<String, dynamic> json) =>
      _$IncludeShippingMethodToShippingZoneResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
    @JsonKey(name: "describes") List<Collection>? describes,
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
    @JsonKey(name: "title") ClassCost25? title,
    @JsonKey(name: "tax_status") TaxStatus? taxStatus,
    @JsonKey(name: "cost") ClassCost25? cost,
    @JsonKey(name: "class_costs") ClassCost25? classCosts,
    @JsonKey(name: "class_cost_25") ClassCost25? classCost25,
    @JsonKey(name: "no_class_cost") ClassCost25? noClassCost,
    @JsonKey(name: "type") Type? type,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

@freezed
class ClassCost25 with _$ClassCost25 {
  const factory ClassCost25({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "default") String? classCost25Default,
    @JsonKey(name: "tip") String? tip,
    @JsonKey(name: "placeholder") String? placeholder,
  }) = _ClassCost25;

  factory ClassCost25.fromJson(Map<String, dynamic> json) =>
      _$ClassCost25FromJson(json);
}

@freezed
class TaxStatus with _$TaxStatus {
  const factory TaxStatus({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "default") String? taxStatusDefault,
    @JsonKey(name: "tip") String? tip,
    @JsonKey(name: "placeholder") String? placeholder,
    @JsonKey(name: "options") TaxStatusOptions? options,
  }) = _TaxStatus;

  factory TaxStatus.fromJson(Map<String, dynamic> json) =>
      _$TaxStatusFromJson(json);
}

@freezed
class TaxStatusOptions with _$TaxStatusOptions {
  const factory TaxStatusOptions({
    @JsonKey(name: "taxable") String? taxable,
    @JsonKey(name: "none") String? none,
  }) = _TaxStatusOptions;

  factory TaxStatusOptions.fromJson(Map<String, dynamic> json) =>
      _$TaxStatusOptionsFromJson(json);
}

@freezed
class Type with _$Type {
  const factory Type({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "default") String? typeDefault,
    @JsonKey(name: "tip") String? tip,
    @JsonKey(name: "placeholder") String? placeholder,
    @JsonKey(name: "options") TypeOptions? options,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}

@freezed
class TypeOptions with _$TypeOptions {
  const factory TypeOptions({
    @JsonKey(name: "class") String? optionsClass,
    @JsonKey(name: "order") String? order,
  }) = _TypeOptions;

  factory TypeOptions.fromJson(Map<String, dynamic> json) =>
      _$TypeOptionsFromJson(json);
}
