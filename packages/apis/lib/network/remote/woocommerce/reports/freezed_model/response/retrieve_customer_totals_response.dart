// To parse this JSON data, do
//
//     final retrieveCustomerTotalsResponse = retrieveCustomerTotalsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_customer_totals_response.freezed.dart';
part 'retrieve_customer_totals_response.g.dart';

List<RetrieveCustomerTotalsResponse> retrieveCustomerTotalsResponseFromJson(String str) => List<RetrieveCustomerTotalsResponse>.from(json.decode(str).map((x) => RetrieveCustomerTotalsResponse.fromJson(x)));

String retrieveCustomerTotalsResponseToJson(List<RetrieveCustomerTotalsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class RetrieveCustomerTotalsResponse with _$RetrieveCustomerTotalsResponse {
    const factory RetrieveCustomerTotalsResponse({
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "total")
        int? total,
    }) = _RetrieveCustomerTotalsResponse;

    factory RetrieveCustomerTotalsResponse.fromJson(Map<String, dynamic> json) => _$RetrieveCustomerTotalsResponseFromJson(json);
}
