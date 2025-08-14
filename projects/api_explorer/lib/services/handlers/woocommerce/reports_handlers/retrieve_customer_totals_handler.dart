import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/reports/abstract/reports_service.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_customer_totals_response.dart';
import 'package:dio/dio.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class RetrieveCustomerTotalsHandler implements ApiRequestHandler {
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
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      print('👥 Retrieve Customer Totals Parameters:');
      print('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<ReportsService>();
      final List<RetrieveCustomerTotalsResponse> response =
          await service.retrieveCustomerTotals(
        apiVersion: apiVersion,
      );

      print(
          '✅ Retrieve Customer Totals Success: Found ${response.length} customer totals');

      return {
        'success': true,
        'data': response.map((customer) => customer.toJson()).toList(),
        'message': 'Customer totals retrieved successfully',
        'count': response.length,
      };
    } on DioException catch (e) {
      String errorMessage = 'Failed to retrieve customer totals';

      if (e.response?.statusCode == 404) {
        errorMessage = 'Customer totals not found';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      print('❌ Retrieve Customer Totals Error: $errorMessage');
      print('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Retrieve Customer Totals Unexpected Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while retrieving customer totals',
        'error_details': e.toString(),
      };
    }
  }
}
