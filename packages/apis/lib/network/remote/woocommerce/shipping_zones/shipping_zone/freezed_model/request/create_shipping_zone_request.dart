// To parse this JSON data, do
//
//     final createShippingZoneRequest = createShippingZoneRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_shipping_zone_request.freezed.dart';
part 'create_shipping_zone_request.g.dart';

CreateShippingZoneRequest createShippingZoneRequestFromJson(String str) =>
    CreateShippingZoneRequest.fromJson(json.decode(str));

String createShippingZoneRequestToJson(CreateShippingZoneRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateShippingZoneRequest with _$CreateShippingZoneRequest {
  const factory CreateShippingZoneRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "order") int? order,
    @JsonKey(name: "locations") List<Location>? locations,
  }) = _CreateShippingZoneRequest;

  factory CreateShippingZoneRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateShippingZoneRequestFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "type") String? type,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
