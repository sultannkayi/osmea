import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/reports/abstract/reports_service.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_report_sale_response.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RetrieveSalesReportHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
          const ApiField(
            name: 'date_min',
            label: 'Date Min',
            hint: 'Start date (YYYY-MM-DD)',
            isRequired: false,
          ),
          const ApiField(
            name: 'date_max',
            label: 'Date Max',
            hint: 'End date (YYYY-MM-DD)',
            isRequired: false,
          ),
          const ApiField(
            name: 'period',
            label: 'Period',
            hint: 'Report period (day, week, month, year)',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Parse parameters
      final apiVersion = params['api_version']?.toString() ?? 'v3';
      final dateMin = params['date_min']?.toString();
      final dateMax = params['date_max']?.toString();
      final period = params['period']?.toString();

      debugPrint('💰 Retrieve Sales Report Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Date Min: $dateMin');
      debugPrint('  Date Max: $dateMax');
      debugPrint('  Period: $period');

      // Get service and call API
      final service = WooNetwork.getIt.get<ReportsService>();
      final List<RetrieveReportSaleResponse> response =
          await service.retrieveSalesReport(
        apiVersion: apiVersion,
        dateMin: dateMin,
        dateMax: dateMax,
        period: period,
      );

      debugPrint(
          '✅ Retrieve Sales Report Success: Found ${response.length} sales reports');

      return {
        'success': true,
        'data': response.map((sale) => sale.toJson()).toList(),
        'message': 'Sales report retrieved successfully',
        'count': response.length,
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve sales report: $e',
        'error_details': e.toString(),
      };
    }
  }
}
