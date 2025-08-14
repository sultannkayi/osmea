import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/webhooks/webhook/abstract/webhook_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ********** 📋 RETRIEVE LIST OF WEBHOOKS HANDLER 📋 ****
/// ******************************************************************

class RetrieveListOfWebhooksHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    try {
      if (method == 'GET') {
        // Parse parameters
        final fieldsParam =
            params['fields']?.isNotEmpty == true ? params['fields'] : null;
        final address =
            params['address']?.isNotEmpty == true ? params['address'] : null;
        final topic =
            params['topic']?.isNotEmpty == true ? params['topic'] : null;
        final sinceId =
            params['since_id']?.isNotEmpty == true ? params['since_id'] : null;
        final createdAtMin = params['created_at_min']?.isNotEmpty == true
            ? params['created_at_min']
            : null;
        final createdAtMax = params['created_at_max']?.isNotEmpty == true
            ? params['created_at_max']
            : null;
        final updatedAtMin = params['updated_at_min']?.isNotEmpty == true
            ? params['updated_at_min']
            : null;
        final updatedAtMax = params['updated_at_max']?.isNotEmpty == true
            ? params['updated_at_max']
            : null;
        final limitStr =
            params['limit']?.isNotEmpty == true ? params['limit'] : null;

        // Parse limit to integer if provided
        int? limit;
        if (limitStr != null) {
          limit = int.tryParse(limitStr);
        }

        debugPrint(
            '🔧 Parameters: fields=$fieldsParam, address=$address, topic=$topic, since_id=$sinceId');

        // Use GetIt service for consistent authentication and approach
        if (fieldsParam != null && fieldsParam.trim().isNotEmpty) {
          return await _handleFieldFiltering(
              fieldsParam,
              address,
              topic,
              sinceId,
              createdAtMin,
              createdAtMax,
              updatedAtMin,
              updatedAtMax,
              limit);
        }

        // Standard request using the GetIt service
        return await _handleStandardRequest(
            address,
            topic,
            sinceId,
            createdAtMin,
            createdAtMax,
            updatedAtMin,
            updatedAtMax,
            limit,
            fieldsParam);
      }

      return {
        "status": "error",
        "message": "Method $method not supported. Use GET instead.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error: ${e.toString()}');
      return {
        "status": "error",
        "message": "Failed to fetch webhooks: ${e.toString()}",
        "apiVersion": ApiNetwork.apiVersion,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Handle field filtering with proper field filtering implementation
  Future<Map<String, dynamic>> _handleFieldFiltering(
      String fields,
      String? address,
      String? topic,
      String? sinceId,
      String? createdAtMin,
      String? createdAtMax,
      String? updatedAtMin,
      String? updatedAtMax,
      int? limit) async {
    debugPrint('📌 Using GetIt service for field filtering: fields=$fields');

    final service = GetIt.I.get<WebhookService>();

    // Only pass non-empty parameters
    final response = await service.getWebhooks(
      apiVersion: ApiNetwork.apiVersion,
      address: address?.trim().isNotEmpty == true ? address : null,
      topic: topic?.trim().isNotEmpty == true ? topic : null,
      since_id: sinceId?.trim().isNotEmpty == true ? sinceId : null,
      created_at_min:
          createdAtMin?.trim().isNotEmpty == true ? createdAtMin : null,
      created_at_max:
          createdAtMax?.trim().isNotEmpty == true ? createdAtMax : null,
      updated_at_min:
          updatedAtMin?.trim().isNotEmpty == true ? updatedAtMin : null,
      updated_at_max:
          updatedAtMax?.trim().isNotEmpty == true ? updatedAtMax : null,
      limit: limit,
    );

    final webhooks = response.webhooks ?? [];
    debugPrint('📊 Received ${webhooks.length} webhooks');

    if (webhooks.isEmpty) {
      return {
        "status": "success",
        "webhooks": [],
        "count": 0,
        "message": "No webhooks found",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Parse the fields parameter and filter each webhook
    final requestedFields = fields.split(',').map((f) => f.trim()).toSet();

    final filteredWebhooks = webhooks.map((webhook) {
      final fullJson = webhook.toJson();
      return Map<String, dynamic>.fromEntries(fullJson.entries
          .where((entry) => requestedFields.contains(entry.key)));
    }).toList();

    debugPrint(
        '✅ Successfully retrieved and filtered ${filteredWebhooks.length} webhooks. Fields: ${requestedFields.join(', ')}');

    return {
      "status": "success",
      "webhooks": filteredWebhooks,
      "count": filteredWebhooks.length,
      "fields_filtered": requestedFields.toList(),
      "message": "Webhooks successfully retrieved with filtered fields",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  // Standard request using the GetIt service
  Future<Map<String, dynamic>> _handleStandardRequest(
      String? address,
      String? topic,
      String? sinceId,
      String? createdAtMin,
      String? createdAtMax,
      String? updatedAtMin,
      String? updatedAtMax,
      int? limit,
      String? fields) async {
    debugPrint('📌 Using standard GetIt service approach');

    final service = GetIt.I.get<WebhookService>();

    // Only pass non-empty parameters
    final response = await service.getWebhooks(
      apiVersion: ApiNetwork.apiVersion,
      address: address?.trim().isNotEmpty == true ? address : null,
      topic: topic?.trim().isNotEmpty == true ? topic : null,
      since_id: sinceId?.trim().isNotEmpty == true ? sinceId : null,
      created_at_min:
          createdAtMin?.trim().isNotEmpty == true ? createdAtMin : null,
      created_at_max:
          createdAtMax?.trim().isNotEmpty == true ? createdAtMax : null,
      updated_at_min:
          updatedAtMin?.trim().isNotEmpty == true ? updatedAtMin : null,
      updated_at_max:
          updatedAtMax?.trim().isNotEmpty == true ? updatedAtMax : null,
      limit: limit,
      fields: fields?.trim().isNotEmpty == true ? fields : null,
    );

    debugPrint('📊 Received ${response.webhooks?.length ?? 0} webhooks');

    return {
      "status": "success",
      "webhooks": response.webhooks?.map((c) => c.toJson()).toList() ?? [],
      "count": response.webhooks?.length ?? 0,
      "message": "Webhooks successfully retrieved",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  // Helper function to format Shopify errors

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'address',
            label: 'Address',
            hint: 'Filter webhooks by address',
            isRequired: false,
          ),
          const ApiField(
            name: 'topic',
            label: 'Topic',
            hint: 'Filter webhooks by topic (e.g., orders/create)',
            isRequired: false,
          ),
          const ApiField(
            name: 'created_at_min',
            label: 'Created At Min',
            hint: 'Show webhooks created after this date (ISO format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'created_at_max',
            label: 'Created At Max',
            hint: 'Show webhooks created before this date (ISO format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'updated_at_min',
            label: 'Updated At Min',
            hint: 'Show webhooks updated after this date (ISO format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'updated_at_max',
            label: 'Updated At Max',
            hint: 'Show webhooks updated before this date (ISO format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'since_id',
            label: 'Since ID',
            hint: 'Show webhooks after this ID (for pagination)',
            isRequired: false,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'limit',
            label: 'Limit',
            hint: 'Maximum number of webhooks to return (default: 50)',
            isRequired: false,
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
