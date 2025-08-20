import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/webhooks/abstract/webhooks_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RetrieveWebhookHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'webhook_id',
            label: 'Webhook ID',
            hint: 'Webhook ID to retrieve (required)',
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
      // Validate required webhook_id parameter
      final webhookIdStr = params['webhook_id']?.toString() ?? '';
      final webhookId = int.tryParse(webhookIdStr);

      if (webhookId == null || webhookId <= 0) {
        return {
          'success': false,
          'message':
              'Valid webhook_id is required and must be a positive integer',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      debugPrint('🔍 Retrieve Webhook Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Webhook ID: $webhookId');

      // Get service and call API
      final service = WooNetwork.getIt.get<WebhooksService>();
      final response = await service.retrieveWebhook(
        apiVersion: apiVersion,
        webhookId: webhookId,
      );

      debugPrint('✅ Retrieve Webhook Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Webhook retrieved successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve webhook: $e',
        'error_details': e.toString(),
      };
    }
  }
}
