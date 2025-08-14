import 'package:api_explorer/services/api_request_handler.dart';
import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/webhooks/webhook/abstract/webhook_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ************* 🔍 RETRIEVE A WEBHOOK HANDLER 🔍 ********
/// ******************************************************************

class RetrieveAWebhookHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    try {
      if (method == 'GET') {
        // Get webhook ID from params and validate
        final idStr = params['id']?.isNotEmpty == true ? params['id'] : null;
        final fieldsParam =
            params['fields']?.isNotEmpty == true ? params['fields'] : null;

        if (idStr == null) {
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

        // When fields parameter is provided, make a direct API call
        if (fieldsParam != null && fieldsParam.trim().isNotEmpty) {
          return await _handleFieldFiltering(id, fieldsParam);
        }

        // Standard path without field filtering
        return await _handleStandardRequest(id, fieldsParam);
      }

      return {
        "status": "error",
        "message": "Method $method not supported. Use GET instead.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error fetching webhook: ${e.toString()}');
      return {
        "status": "error",
        "message": "Failed to retrieve webhook: ${e.toString()}",
        "requestDetails": {
          "apiVersion": ApiNetwork.apiVersion,
          "id": params['id'],
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Handle field filtering using GetIt service with proper field filtering
  Future<Map<String, dynamic>> _handleFieldFiltering(
      int id, String fields) async {
    debugPrint('📌 Using GetIt service for field filtering: fields=$fields');

    final service = GetIt.I.get<WebhookService>();
    final response = await service.getWebhook(
      apiVersion: ApiNetwork.apiVersion,
      id: id,
      fields: fields.trim().isNotEmpty ? fields : null,
    );

    final webhook = response.webhook;
    if (webhook == null) {
      return {
        "status": "error",
        "message": "Webhook not found or no data returned",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Parse the fields parameter and filter the response
    final requestedFields = fields.split(',').map((f) => f.trim()).toSet();
    final fullJson = webhook.toJson();

    // Create a new map with only the requested fields
    final filteredWebhook = Map<String, dynamic>.fromEntries(
        fullJson.entries.where((entry) => requestedFields.contains(entry.key)));

    debugPrint(
        '✅ Successfully retrieved and filtered webhook. Fields: ${requestedFields.join(', ')}');

    return {
      "status": "success",
      "webhook": filteredWebhook,
      "fields_filtered": requestedFields.toList(),
      "message": "Webhook successfully retrieved with filtered fields",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  // Standard request using the model
  Future<Map<String, dynamic>> _handleStandardRequest(
      int id, String? fields) async {
    final service = GetIt.I.get<WebhookService>();

    // Only include fields if non-empty
    final response = await service.getWebhook(
      apiVersion: ApiNetwork.apiVersion,
      id: id,
      fields: fields?.trim().isNotEmpty == true ? fields : null,
    );

    final webhook = response.webhook;
    if (webhook == null) {
      return {
        "status": "error",
        "message": "Webhook not found or no data returned",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    debugPrint('✅ Successfully retrieved webhook');

    return {
      "status": "success",
      "webhook": webhook.toJson(),
      "message": "Webhook successfully retrieved",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'id',
            label: 'Webhook ID',
            hint: 'ID of the specific webhook',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint:
                'Comma-separated list of fields to include (e.g., id,address,topic)',
            isRequired: false,
          ),
        ],
      };
}
