import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/reports/abstract/reports_service.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/list_all_reports_response.dart';
import 'package:dio/dio.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class ListAllReportsHandler implements ApiRequestHandler {
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

      print('📊 List All Reports Parameters:');
      print('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<ReportsService>();
      final List<ListAllReportsResponse> response =
          await service.listAllReports(
        apiVersion: apiVersion,
      );

      print('✅ List All Reports Success: Found ${response.length} reports');

      return {
        'success': true,
        'data': response.map((report) => report.toJson()).toList(),
        'message': 'Reports retrieved successfully',
        'count': response.length,
      };
    } on DioException catch (e) {
      String errorMessage = 'Failed to retrieve reports';

      if (e.response?.statusCode == 404) {
        errorMessage = 'Reports not found';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      print('❌ List All Reports Error: $errorMessage');
      print('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ List All Reports Unexpected Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while retrieving reports',
        'error_details': e.toString(),
      };
    }
  }
}
