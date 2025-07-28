// To parse this JSON data, do
//
//     final retrieveReportSaleResponse = retrieveReportSaleResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'retrieve_report_sale_response.freezed.dart';
part 'retrieve_report_sale_response.g.dart';

List<RetrieveReportSaleResponse> retrieveReportSaleResponseFromJson(String str) => List<RetrieveReportSaleResponse>.from(json.decode(str).map((x) => RetrieveReportSaleResponse.fromJson(x)));

String retrieveReportSaleResponseToJson(List<RetrieveReportSaleResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class RetrieveReportSaleResponse with _$RetrieveReportSaleResponse {
    const factory RetrieveReportSaleResponse({
        @JsonKey(name: "total_sales")
        String? totalSales,
        @JsonKey(name: "net_sales")
        String? netSales,
        @JsonKey(name: "average_sales")
        String? averageSales,
        @JsonKey(name: "total_orders")
        int? totalOrders,
        @JsonKey(name: "total_items")
        int? totalItems,
        @JsonKey(name: "total_tax")
        String? totalTax,
        @JsonKey(name: "total_shipping")
        String? totalShipping,
        @JsonKey(name: "total_refunds")
        int? totalRefunds,
        @JsonKey(name: "total_discount")
        String? totalDiscount,
        @JsonKey(name: "totals_grouped_by")
        String? totalsGroupedBy,
        @JsonKey(name: "totals")
        Totals? totals,
        @JsonKey(name: "total_customers")
        int? totalCustomers,
        @JsonKey(name: "_links")
        Links? links,
    }) = _RetrieveReportSaleResponse;

    factory RetrieveReportSaleResponse.fromJson(Map<String, dynamic> json) => _$RetrieveReportSaleResponseFromJson(json);
}

@freezed
class Links with _$Links {
    const factory Links({
        @JsonKey(name: "about")
        List<About>? about,
    }) = _Links;

    factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class About with _$About {
    const factory About({
        @JsonKey(name: "href")
        String? href,
    }) = _About;

    factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);
}

@freezed
class Totals with _$Totals {
    const factory Totals({
        @JsonKey(name: "2025-07-27")
        The20250727? the20250727,
    }) = _Totals;

    factory Totals.fromJson(Map<String, dynamic> json) => _$TotalsFromJson(json);
}

@freezed
class The20250727 with _$The20250727 {
    const factory The20250727({
        @JsonKey(name: "sales")
        String? sales,
        @JsonKey(name: "orders")
        int? orders,
        @JsonKey(name: "items")
        int? items,
        @JsonKey(name: "tax")
        String? tax,
        @JsonKey(name: "shipping")
        String? shipping,
        @JsonKey(name: "discount")
        String? discount,
        @JsonKey(name: "customers")
        int? customers,
    }) = _The20250727;

    factory The20250727.fromJson(Map<String, dynamic> json) => _$The20250727FromJson(json);
}
