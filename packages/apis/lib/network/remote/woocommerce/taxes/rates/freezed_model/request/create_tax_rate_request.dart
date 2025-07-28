// To parse this JSON data, do
//
//     final createTaxRateRequest = createTaxRateRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_tax_rate_request.freezed.dart';
part 'create_tax_rate_request.g.dart';

CreateTaxRateRequest createTaxRateRequestFromJson(String str) => CreateTaxRateRequest.fromJson(json.decode(str));

String createTaxRateRequestToJson(CreateTaxRateRequest data) => json.encode(data.toJson());

@freezed
class CreateTaxRateRequest with _$CreateTaxRateRequest {
    const factory CreateTaxRateRequest({
        @JsonKey(name: "country")
        String? country,
        @JsonKey(name: "state")
        String? state,
        @JsonKey(name: "postcode")
        String? postcode,
        @JsonKey(name: "city")
        String? city,
        @JsonKey(name: "postcodes")
        List<String>? postcodes,
        @JsonKey(name: "cities")
        List<String>? cities,
        @JsonKey(name: "rate")
        String? rate,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "priority")
        int? priority,
        @JsonKey(name: "compound")
        bool? compound,
        @JsonKey(name: "shipping")
        bool? shipping,
        @JsonKey(name: "order")
        int? order,
        @JsonKey(name: "class")
        String? createTaxRateRequestClass,
    }) = _CreateTaxRateRequest;

    factory CreateTaxRateRequest.fromJson(Map<String, dynamic> json) => _$CreateTaxRateRequestFromJson(json);
}
