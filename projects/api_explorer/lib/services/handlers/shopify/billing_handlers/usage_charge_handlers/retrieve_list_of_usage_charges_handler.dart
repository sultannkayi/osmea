import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/billing/usage_charge/abstract/usage_charge_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ************* 📋 RETRIEVE LIST OF USAGE CHARGES HANDLER 📋 ********
/// ******************************************************************

class RetrieveListOfUsageChargesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, dynamic> params) async {
    try {
      if (method == 'GET') {
        // Add debug logging at the start
        debugPrint('🔍 Processing request: method=$method, params=$params');

        // Parse parameters
        final recurringApplicationChargeIdStr =
            params['recurring_application_charge_id'] as String?;
        final fieldsParam = params['fields'] as String?;

        if (recurringApplicationChargeIdStr == null ||
            recurringApplicationChargeIdStr.isEmpty) {
          return {
            "status": "error",
            "message": "Recurring Application Charge ID is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Parse the ID from string to int
        int recurringApplicationChargeId;
        try {
          recurringApplicationChargeId =
              int.parse(recurringApplicationChargeIdStr);
        } catch (e) {
          return {
            "status": "error",
            "message":
                "Invalid Recurring Application Charge ID: must be a number",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Explicitly check for both null AND empty/whitespace-only strings
        final hasFieldFilter =
            fieldsParam != null && fieldsParam.trim().isNotEmpty;

        debugPrint(
            '🔧 Parameters: fields=$fieldsParam (hasFilter=$hasFieldFilter), recurring_application_charge_id=$recurringApplicationChargeId');

        // When fields parameter has an actual value, make a direct API call
        if (hasFieldFilter) {
          return await _handleFieldFiltering(
              recurringApplicationChargeId, fieldsParam.trim());
        }

        // Standard path without field filtering
        return await _handleStandardRequest(recurringApplicationChargeId);
      }

      return {
        "status": "error",
        "message": "Method $method not supported. Use GET instead.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error fetching usage charges: ${e.toString()}');
      return {
        "status": "error",
        "message": "Failed to retrieve usage charges: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Handle field filtering with proper field filtering implementation
  Future<Map<String, dynamic>> _handleFieldFiltering(
      int recurringApplicationChargeId, String fields) async {
    debugPrint('📌 Using GetIt service for field filtering: fields=$fields');

    final service = GetIt.I.get<UsageChargeService>();
    final response = await service.getUsageCharges(
      apiVersion: ApiNetwork.apiVersion,
      recurringApplicationChargeId: recurringApplicationChargeId,
    );

    final charges = response.usageCharges ?? [];
    debugPrint('📊 Received ${charges.length} usage charges');

    if (charges.isEmpty) {
      return {
        "status": "success",
        "usage_charges": [],
        "count": 0,
        "message": "No usage charges found",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Parse the fields parameter and filter each charge
    final requestedFields = fields.split(',').map((f) => f.trim()).toSet();

    final filteredCharges = charges.map((charge) {
      final fullJson = charge.toJson();
      return Map<String, dynamic>.fromEntries(fullJson.entries
          .where((entry) => requestedFields.contains(entry.key)));
    }).toList();

    debugPrint(
        '✅ Successfully retrieved and filtered ${filteredCharges.length} usage charges. Fields: ${requestedFields.join(', ')}');

    return {
      "status": "success",
      "usage_charges": filteredCharges,
      "count": filteredCharges.length,
      "fields_filtered": requestedFields.toList(),
      "message": "Usage charges successfully retrieved with filtered fields",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  // Standard request using the GetIt service
  Future<Map<String, dynamic>> _handleStandardRequest(
      int recurringApplicationChargeId) async {
    debugPrint('📌 Using standard GetIt service approach');

    final service = GetIt.I.get<UsageChargeService>();

    try {
      final response = await service.getUsageCharges(
        apiVersion: ApiNetwork.apiVersion,
        recurringApplicationChargeId: recurringApplicationChargeId,
      );

      // Check if usageCharges is null - this is likely happening when there are no charges
      final charges = response.usageCharges ?? [];
      debugPrint('📊 Received ${charges.length} usage charges');

      return {
        "status": "success",
        "usage_charges": charges.map((c) => c.toJson()).toList(),
        "count": charges.length,
        "message": "Usage charges successfully retrieved",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Provide more detailed error info for debugging
      debugPrint('❌ Model error: ${e.toString()}');

      // Handle the case where the model throws an error due to null response
      return {
        "status": "success",
        "data": {
          "usage_charges": [] // Return empty list instead of null
        },
        "count": 0,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'recurring_application_charge_id',
            label: 'Recurring Application Charge ID',
            hint: 'ID of the recurring application charge',
            isRequired: true,
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint:
                'Comma-separated list of fields to include (e.g., id,description,price)',
            isRequired: false,
          ),
        ],
      };
}
