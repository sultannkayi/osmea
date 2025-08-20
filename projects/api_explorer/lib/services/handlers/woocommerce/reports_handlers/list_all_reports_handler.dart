import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/reports/abstract/reports_service.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/list_all_reports_response.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

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

      debugPrint('📊 List All Reports Parameters:');
      debugPrint('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<ReportsService>();
      final List<ListAllReportsResponse> response =
          await service.listAllReports(
        apiVersion: apiVersion,
      );

      debugPrint('✅ List All Reports Success: Found ${response.length} reports');

      return {
        'success': true,
        'data': response.map((report) => report.toJson()).toList(),
        'message': 'Reports retrieved successfully',
        'count': response.length,
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve reports: $e',
        'error_details': e.toString(),
      };
    }
  }
}
