import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/system_status/abstract/system_status_service.dart';
import 'package:apis/network/remote/woocommerce/system_status/freezed_model/response/list_all_tools_from_system_status_response.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class ListAllToolsFromSystemStatusHandler implements ApiRequestHandler {
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

      debugPrint('🔧 List All Tools From System Status Parameters:');
      debugPrint('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<SystemStatusService>();
      final List<ListAllToolsFromSystemStatusResponse> response =
          await service.listAllToolsFromSystemStatus(
        apiVersion: apiVersion,
      );

      debugPrint(
          '✅ List All Tools From System Status Success: Found ${response.length} tools');

      return {
        'success': true,
        'data': response.map((tool) => tool.toJson()).toList(),
        'message': 'System status tools retrieved successfully',
        'count': response.length,
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve system status tools: $e',
        'error_details': e.toString(),
      };
    }
  }
}
