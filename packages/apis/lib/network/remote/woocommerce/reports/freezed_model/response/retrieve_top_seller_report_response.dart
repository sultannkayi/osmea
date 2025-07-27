
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retrieve_top_seller_report_response.freezed.dart';
part 'retrieve_top_seller_report_response.g.dart';

@freezed
class RetrieveTopSellerReportResponse with _$RetrieveTopSellerReportResponse {
  const factory RetrieveTopSellerReportResponse({
    required int product_id,
    required String product_name,
    required int quantity,
    required double total,
    String? sku,
    String? category,
  }) = _RetrieveTopSellerReportResponse;

  factory RetrieveTopSellerReportResponse.fromJson(Map<String, dynamic> json) =>
      _$RetrieveTopSellerReportResponseFromJson(json);
}
