import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/system_status/abstract/system_status_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RetrieveToolFromSystemStatusHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'tool_id',
            label: 'Tool ID',
            hint: 'Tool ID to retrieve (required)',
            isRequired: true,
          ),
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
      // Validate required tool_id parameter
      final toolId = params['tool_id']?.toString().trim();
      if (toolId == null || toolId.isEmpty) {
        return {
          'success': false,
          'message': 'Tool ID is required and cannot be empty',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      debugPrint('🔧 Retrieve Tool From System Status Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Tool ID: $toolId');

      // Get service and call API
      final service = WooNetwork.getIt.get<SystemStatusService>();
      final response = await service.retrieveToolFromSystemStatus(
        apiVersion: apiVersion,
        toolId: toolId,
      );

      debugPrint('✅ Retrieve Tool From System Status Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'System status tool retrieved successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve system status tool: $e',
        'error_details': e.toString(),
      };
    }
  }
}
