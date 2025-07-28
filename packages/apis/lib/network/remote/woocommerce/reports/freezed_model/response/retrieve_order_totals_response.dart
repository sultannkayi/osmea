// To parse this JSON data, do
//
//     final retrieveOrderTotalsResponse = retrieveOrderTotalsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_order_totals_response.freezed.dart';
part 'retrieve_order_totals_response.g.dart';

List<RetrieveOrderTotalsResponse> retrieveOrderTotalsResponseFromJson(String str) => List<RetrieveOrderTotalsResponse>.from(json.decode(str).map((x) => RetrieveOrderTotalsResponse.fromJson(x)));

String retrieveOrderTotalsResponseToJson(List<RetrieveOrderTotalsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class RetrieveOrderTotalsResponse with _$RetrieveOrderTotalsResponse {
    const factory RetrieveOrderTotalsResponse({
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "total")
        int? total,
    }) = _RetrieveOrderTotalsResponse;

    factory RetrieveOrderTotalsResponse.fromJson(Map<String, dynamic> json) => _$RetrieveOrderTotalsResponseFromJson(json);
}
