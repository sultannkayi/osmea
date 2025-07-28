
// To parse this JSON data, do
//
//     final retrieveTopSellerReportResponse = retrieveTopSellerReportResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_top_seller_report_response.freezed.dart';
part 'retrieve_top_seller_report_response.g.dart';

List<RetrieveTopSellerReportResponse> retrieveTopSellerReportResponseFromJson(String str) => List<RetrieveTopSellerReportResponse>.from(json.decode(str).map((x) => RetrieveTopSellerReportResponse.fromJson(x)));

String retrieveTopSellerReportResponseToJson(List<RetrieveTopSellerReportResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class RetrieveTopSellerReportResponse with _$RetrieveTopSellerReportResponse {
  const factory RetrieveTopSellerReportResponse({
    @JsonKey(name: "product_id")
    int? productId,
    @JsonKey(name: "product_name") 
    String? productName,
    @JsonKey(name: "quantity")
    int? quantity,
    @JsonKey(name: "total")
    String? total,
    @JsonKey(name: "sku")
    String? sku,
    @JsonKey(name: "category")
    String? category,
  }) = _RetrieveTopSellerReportResponse;

  factory RetrieveTopSellerReportResponse.fromJson(Map<String, dynamic> json) =>
      _$RetrieveTopSellerReportResponseFromJson(json);
}
