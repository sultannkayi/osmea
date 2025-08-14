import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/reports/abstract/reports_service.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_report_sale_response.dart';
import 'package:dio/dio.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

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

      print('💰 Retrieve Sales Report Parameters:');
      print('  API Version: $apiVersion');
      print('  Date Min: $dateMin');
      print('  Date Max: $dateMax');
      print('  Period: $period');

      // Get service and call API
      final service = WooNetwork.getIt.get<ReportsService>();
      final List<RetrieveReportSaleResponse> response =
          await service.retrieveSalesReport(
        apiVersion: apiVersion,
        dateMin: dateMin,
        dateMax: dateMax,
        period: period,
      );

      print(
          '✅ Retrieve Sales Report Success: Found ${response.length} sales reports');

      return {
        'success': true,
        'data': response.map((sale) => sale.toJson()).toList(),
        'message': 'Sales report retrieved successfully',
        'count': response.length,
      };
    } on DioException catch (e) {
      String errorMessage = 'Failed to retrieve sales report';

      if (e.response?.statusCode == 404) {
        errorMessage = 'Sales report not found';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      print('❌ Retrieve Sales Report Error: $errorMessage');
      print('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Retrieve Sales Report Unexpected Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while retrieving sales report',
        'error_details': e.toString(),
      };
    }
  }
}
