import 'package:api_explorer/services/api_request_handler.dart';
import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/webhooks/webhook/abstract/webhook_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ************* 🗑️ DELETE WEBHOOK HANDLER 🗑️ **********************
/// ******************************************************************

class DeleteWebhookHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    try {
      if (method == 'DELETE') {
        // Extract and validate required parameters
        final idStr = params['id'];

        if (idStr == null || idStr.trim().isEmpty) {
          return {
            "status": "error",
            "message": "Webhook ID is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Parse the ID from string to int, with error handling
        int id;
        try {
          id = int.parse(idStr);
        } catch (e) {
          return {
            "status": "error",
            "message": "Invalid Webhook ID: must be a number",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        return await _handleDeleteWebhook(id);
      }

      return {
        "status": "error",
        "message": "Method $method not supported. Use DELETE instead.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error: ${e.toString()}');
      return {
        "status": "error",
        "message": "Failed to delete webhook: ${e.toString()}",
        "apiVersion": ApiNetwork.apiVersion,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleDeleteWebhook(int id) async {
    debugPrint('🗑️ Deleting webhook with ID: $id');

    try {
      final service = GetIt.I.get<WebhookService>();
      await service.deleteWebhook(
        apiVersion: ApiNetwork.apiVersion,
        id: id,
      );

      debugPrint('✅ Successfully deleted webhook with ID: $id');

      return {
        "status": "success",
        "message": "Webhook deleted successfully",
        "data": {
          "id": id,
          "deleted": true,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error deleting webhook: $e');

      // Handle error and provide user-friendly response
      return {
        "status": "error",
        "message": "Failed to delete webhook: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'id',
            label: 'Webhook ID',
            hint: 'ID of the webhook to delete',
            isRequired: true,
            type: ApiFieldType.number,
          ),
        ],
      };
}
