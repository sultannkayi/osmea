// To parse this JSON data, do
//
//     final retrieveCouponTotalsResponse = retrieveCouponTotalsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_coupon_totals_response.freezed.dart';
part 'retrieve_coupon_totals_response.g.dart';

List<RetrieveCouponTotalsResponse> retrieveCouponTotalsResponseFromJson(String str) => List<RetrieveCouponTotalsResponse>.from(json.decode(str).map((x) => RetrieveCouponTotalsResponse.fromJson(x)));

String retrieveCouponTotalsResponseToJson(List<RetrieveCouponTotalsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class RetrieveCouponTotalsResponse with _$RetrieveCouponTotalsResponse {
    const factory RetrieveCouponTotalsResponse({
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "total")
        int? total,
    }) = _RetrieveCouponTotalsResponse;

    factory RetrieveCouponTotalsResponse.fromJson(Map<String, dynamic> json) => _$RetrieveCouponTotalsResponseFromJson(json);
}
