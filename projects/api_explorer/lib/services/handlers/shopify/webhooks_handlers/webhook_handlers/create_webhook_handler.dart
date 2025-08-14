import 'package:api_explorer/services/api_request_handler.dart';
import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/webhooks/webhook/abstract/webhook_service.dart';
import 'package:apis/network/remote/shopify/webhooks/webhook/freezed_model/request/create_webhook_request.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ************* 📝 CREATE WEBHOOK HANDLER 📝 **********************
/// ******************************************************************

class CreateWebhookHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    try {
      if (method == 'POST') {
        // Extract required parameters
        final topic = params['topic'];
        final address = params['address'];
        final format = params['format'] ?? 'json';

        // Validate required parameters
        if (topic == null || topic.trim().isEmpty) {
          return {
            "status": "error",
            "message": "Topic is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (address == null || address.trim().isEmpty) {
          return {
            "status": "error",
            "message": "Address is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Create request model
        final webhookData =
            WebhookData(topic: topic, address: address, format: format);

        final request = CreateWebhookRequest(webhook: webhookData);

        return await _handleCreateWebhook(request);
      }

      return {
        "status": "error",
        "message": "Method $method not supported. Use POST instead.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error: ${e.toString()}');
      return {
        "status": "error",
        "message": "Failed to create webhook: ${e.toString()}",
        "apiVersion": ApiNetwork.apiVersion,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleCreateWebhook(
      CreateWebhookRequest request) async {
    debugPrint(
        '📝 Creating webhook with topic: ${request.webhook.topic}, address: ${request.webhook.address}');

    try {
      final service = GetIt.I.get<WebhookService>();
      final response = await service.createWebhook(
        apiVersion: ApiNetwork.apiVersion,
        model: request,
      );

      final webhook = response.webhook;
      if (webhook == null) {
        return {
          "status": "error",
          "message": "Failed to create webhook - no data returned",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      debugPrint('✅ Successfully created webhook with ID: ${webhook.id}');

      return {
        "status": "success",
        "message": "Webhook created successfully",
        "data": {"webhook": webhook.toJson()},
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error creating webhook: $e');

      // Handle error and provide user-friendly response
      return {
        "status": "error",
        "message": "Failed to create webhook: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'topic',
            label: 'Topic',
            hint: 'Event topic to subscribe to (e.g., orders/create)',
            isRequired: true,
          ),
          const ApiField(
            name: 'address',
            label: 'Address',
            hint: 'URL where the webhook should send the POST request',
            isRequired: true,
          ),
          const ApiField(
            name: 'format',
            label: 'Format',
            hint: 'Format of the data sent (default: json)',
            isRequired: false,
          ),
        ],
      };
}
