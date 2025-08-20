import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/system_status/abstract/system_status_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RunToolFromSystemStatusHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'tool_id',
            label: 'Tool ID',
            hint: 'Tool ID to run (required)',
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

      debugPrint('🔧 Run Tool From System Status Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Tool ID: $toolId');

      // Get service and call API
      final service = WooNetwork.getIt.get<SystemStatusService>();
      final response = await service.runToolFromSystemStatus(
        apiVersion: apiVersion,
        toolId: toolId,
      );

      debugPrint('✅ Run Tool From System Status Success: ${response.toJson()}');

      // Provide appropriate message based on success status
      String successMessage = 'System status tool executed successfully';
      if (response.success == true) {
        successMessage = 'System status tool executed successfully';
      } else if (response.success == false) {
        successMessage = 'System status tool execution failed';
      }

      return {
        'success': true,
        'message': successMessage,
        'data': response.toJson(),
        'tool_success': response.success,
        'tool_message': response.message,
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to run system status tool: $e',
        'error_details': e.toString(),
      };
    }
  }
}
