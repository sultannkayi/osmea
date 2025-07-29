// To parse this JSON data, do
//
//     final includeShippingMethodToShippingZoneRequest = includeShippingMethodToShippingZoneRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'include_shipping_method_to_shipping_zone_request.freezed.dart';
part 'include_shipping_method_to_shipping_zone_request.g.dart';

IncludeShippingMethodToShippingZoneRequest
    includeShippingMethodToShippingZoneRequestFromJson(String str) =>
        IncludeShippingMethodToShippingZoneRequest.fromJson(json.decode(str));

String includeShippingMethodToShippingZoneRequestToJson(
        IncludeShippingMethodToShippingZoneRequest data) =>
    json.encode(data.toJson());

@freezed
class IncludeShippingMethodToShippingZoneRequest
    with _$IncludeShippingMethodToShippingZoneRequest {
  const factory IncludeShippingMethodToShippingZoneRequest({
    @JsonKey(name: "method_id") String? methodId,
    @JsonKey(name: "enabled") bool? enabled,
    @JsonKey(name: "order") int? order,
    @JsonKey(name: "settings") Settings? settings,
  }) = _IncludeShippingMethodToShippingZoneRequest;

  factory IncludeShippingMethodToShippingZoneRequest.fromJson(
          Map<String, dynamic> json) =>
      _$IncludeShippingMethodToShippingZoneRequestFromJson(json);
}

@freezed
class Settings with _$Settings {
  const factory Settings({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "tax_status") String? taxStatus,
    @JsonKey(name: "cost") String? cost,
    @JsonKey(name: "class_costs") String? classCosts,
    @JsonKey(name: "class_cost_91") String? classCost91,
    @JsonKey(name: "class_cost_92") String? classCost92,
    @JsonKey(name: "no_class_cost") String? noClassCost,
    @JsonKey(name: "type") String? type,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
