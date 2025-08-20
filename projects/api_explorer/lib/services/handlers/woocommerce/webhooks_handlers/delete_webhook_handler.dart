import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/webhooks/abstract/webhooks_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class WooDeleteWebhookHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'webhook_id',
            label: 'Webhook ID',
            hint: 'Webhook ID to delete (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Whether to permanently delete (true/false/1/0)',
            isRequired: false,
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

      // Parse force parameter
      bool? force;
      if (params['force'] != null) {
        final forceStr = params['force'].toString().toLowerCase();
        if (forceStr == 'true' || forceStr == '1') {
          force = true;
        } else if (forceStr == 'false' || forceStr == '0') {
          force = false;
        }
      }

      debugPrint('🗑️ Delete Webhook Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Webhook ID: $webhookId');
      debugPrint('  Force Delete: $force');

      // Get service and call API
      final service = WooNetwork.getIt.get<WebhooksService>();
      final response = await service.deleteWebhook(
        apiVersion: apiVersion,
        webhookId: webhookId,
        force: force,
      );

      debugPrint('✅ Delete Webhook Success: ${response.toJson()}');

      // Provide appropriate message based on force parameter
      String successMessage = 'Webhook deleted successfully';
      if (force == true) {
        successMessage = 'Webhook permanently deleted';
      } else if (force == false) {
        successMessage = 'Webhook moved to trash';
      }

      return {
        'success': true,
        'message': successMessage,
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to delete webhook: $e',
        'error_details': e.toString(),
      };
    }
  }
}
