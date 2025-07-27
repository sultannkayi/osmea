// To parse this JSON data, do
//
//     final retrieveProductTotalsResponse = retrieveProductTotalsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_product_totals_response.freezed.dart';
part 'retrieve_product_totals_response.g.dart';

List<RetrieveProductTotalsResponse> retrieveProductTotalsResponseFromJson(String str) => List<RetrieveProductTotalsResponse>.from(json.decode(str).map((x) => RetrieveProductTotalsResponse.fromJson(x)));

String retrieveProductTotalsResponseToJson(List<RetrieveProductTotalsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class RetrieveProductTotalsResponse with _$RetrieveProductTotalsResponse {
    const factory RetrieveProductTotalsResponse({
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "total")
        int? total,
    }) = _RetrieveProductTotalsResponse;

    factory RetrieveProductTotalsResponse.fromJson(Map<String, dynamic> json) => _$RetrieveProductTotalsResponseFromJson(json);
}
