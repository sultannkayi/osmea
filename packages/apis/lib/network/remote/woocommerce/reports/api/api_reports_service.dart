import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/reports/abstract/reports_service.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/list_all_reports_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_coupon_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_customer_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_order_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_product_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_report_sale_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_review_totals_response.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_top_seller_report_response.dart';

part 'api_reports_service.g.dart';

@RestApi()
@Injectable(as: ReportsService)
abstract class ApiReportsService implements ReportsService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ApiReportsService(Dio dio) => _ApiReportsService(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/reports')
  Future<List<ListAllReportsResponse>> listAllReports({
    @Path('apiVersion') required String apiVersion,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/reports/coupons/totals')
  Future<List<RetrieveCouponTotalsResponse>> retrieveCouponTotals({
    @Path('apiVersion') required String apiVersion,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/reports/customers/totals')
  Future<List<RetrieveCustomerTotalsResponse>> retrieveCustomerTotals({
    @Path('apiVersion') required String apiVersion,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/reports/orders/totals')
  Future<List<RetrieveOrderTotalsResponse>> retrieveOrderTotals({
    @Path('apiVersion') required String apiVersion,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/reports/products/totals')
  Future<List<RetrieveProductTotalsResponse>> retrieveProductTotals({
    @Path('apiVersion') required String apiVersion,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/reports/sales')
  Future<List<RetrieveReportSaleResponse>> retrieveSalesReport({
    @Path('apiVersion') required String apiVersion,
    @Query('date_min') String? dateMin,
    @Query('date_max') String? dateMax,
    @Query('period') String? period,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/reports/reviews/totals')
  Future<List<RetrieveReviewTotalsResponse>> retrieveReviewTotals({
    @Path('apiVersion') required String apiVersion,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/reports/top_sellers')
  Future<List<RetrieveTopSellerReportResponse>> retrieveTopSellersReport({
    @Path('apiVersion') required String apiVersion,
    @Query('date_min') String? dateMin,
    @Query('date_max') String? dateMax,
    @Query('limit') int? limit,
  });
}