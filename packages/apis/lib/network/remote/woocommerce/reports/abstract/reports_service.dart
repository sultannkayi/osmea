import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/list_all_reports_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_coupon_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_customer_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_order_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_product_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_report_sale_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_review_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_top_seller_report_response.dart';

abstract class ReportsService {
  /// List all reports
  Future<List<ListAllReportsResponse>> listAllReports({
    required String apiVersion,
  });

  /// Retrieve coupon totals report
  Future<List<RetrieveCouponTotalsResponse>> retrieveCouponTotals({
    required String apiVersion,
  });

  /// Retrieve customer totals report
  Future<List<RetrieveCustomerTotalsResponse>> retrieveCustomerTotals({
    required String apiVersion,
  });

  /// Retrieve order totals report
  Future<List<RetrieveOrderTotalsResponse>> retrieveOrderTotals({
    required String apiVersion,
  });

  /// Retrieve product totals report
  Future<List<RetrieveProductTotalsResponse>> retrieveProductTotals({
    required String apiVersion,
  });

  /// Retrieve sales report
  Future<List<RetrieveReportSaleResponse>> retrieveSalesReport({
    required String apiVersion,
    String? dateMin,
    String? dateMax,
    String? period,
  });

  /// Retrieve review totals report
  Future<List<RetrieveReviewTotalsResponse>> retrieveReviewTotals({
    required String apiVersion,
  });

  /// Retrieve top sellers report
  Future<List<RetrieveTopSellerReportResponse>> retrieveTopSellersReport({
    required String apiVersion,
    String? dateMin,
    String? dateMax,
    int? limit,
  });
}