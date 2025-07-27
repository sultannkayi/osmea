// To parse this JSON data, do
//
//     final retrieveReviewTotalsResponse = retrieveReviewTotalsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_review_totals_response.freezed.dart';
part 'retrieve_review_totals_response.g.dart';

List<RetrieveReviewTotalsResponse> retrieveReviewTotalsResponseFromJson(String str) => List<RetrieveReviewTotalsResponse>.from(json.decode(str).map((x) => RetrieveReviewTotalsResponse.fromJson(x)));

String retrieveReviewTotalsResponseToJson(List<RetrieveReviewTotalsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class RetrieveReviewTotalsResponse with _$RetrieveReviewTotalsResponse {
    const factory RetrieveReviewTotalsResponse({
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "total")
        int? total,
    }) = _RetrieveReviewTotalsResponse;

    factory RetrieveReviewTotalsResponse.fromJson(Map<String, dynamic> json) => _$RetrieveReviewTotalsResponseFromJson(json);
}
