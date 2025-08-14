import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/billing/usage_charge/abstract/usage_charge_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ************* 🔍 RETRIEVE A USAGE CHARGE HANDLER 🔍 ********
/// ******************************************************************

class RetrieveAUsageChargeHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, dynamic> params) async {
    try {
      if (method == 'GET') {
        // Add debug logging at the start
        debugPrint('🔍 Processing request: method=$method, params=$params');

        // Get charge IDs from params and validate
        final recurringApplicationChargeIdStr =
            params['recurring_application_charge_id'] as String?;
        final idStr = params['id'] as String?;
        final fieldsParam = params['fields'] as String?;

        if (recurringApplicationChargeIdStr == null ||
            recurringApplicationChargeIdStr.isEmpty) {
          return {
            "status": "error",
            "message": "Recurring Application Charge ID is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (idStr == null || idStr.isEmpty) {
          return {
            "status": "error",
            "message": "Usage Charge ID is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Parse the IDs from string to int
        int recurringApplicationChargeId;
        int id;
        try {
          recurringApplicationChargeId =
              int.parse(recurringApplicationChargeIdStr);
          id = int.parse(idStr);
        } catch (e) {
          return {
            "status": "error",
            "message": "Invalid ID format: must be a number",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Make the field filtering check more explicit for clarity
        final hasFieldFilter =
            fieldsParam != null && fieldsParam.trim().isNotEmpty;
        debugPrint(
            '🔧 Parameters: fields=$fieldsParam (hasFilter=$hasFieldFilter), id=$id, recurring_application_charge_id=$recurringApplicationChargeId');

        if (hasFieldFilter) {
          return await _handleFieldFiltering(
              recurringApplicationChargeId, id, fieldsParam.trim());
        }

        // Standard path without field filtering
        return await _handleStandardRequest(recurringApplicationChargeId, id);
      }

      return {
        "status": "error",
        "message": "Method $method not supported. Use GET instead.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error fetching usage charge: ${e.toString()}');
      return {
        "status": "error",
        "message": "Failed to retrieve usage charge: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Handle field filtering using GetIt service with proper field filtering
  Future<Map<String, dynamic>> _handleFieldFiltering(
      int recurringApplicationChargeId, int id, String fields) async {
    debugPrint('📌 Using GetIt service for field filtering: fields=$fields');

    try {
      final service = GetIt.I.get<UsageChargeService>();
      final response = await service.getUsageCharge(
        apiVersion: ApiNetwork.apiVersion,
        recurringApplicationChargeId: recurringApplicationChargeId,
        id: id,
      );

      final charge = response.usageCharge;
      if (charge == null) {
        return {
          "status": "error",
          "message": "Usage charge not found or no data returned",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse the fields parameter and filter the response
      final requestedFields = fields.split(',').map((f) => f.trim()).toSet();
      final fullJson = charge.toJson();

      // Create a new map with only the requested fields
      final filteredCharge = Map<String, dynamic>.fromEntries(fullJson.entries
          .where((entry) => requestedFields.contains(entry.key)));

      debugPrint(
          '✅ Successfully retrieved and filtered usage charge. Fields: ${requestedFields.join(', ')}');

      return {
        "status": "success",
        "usage_charge": filteredCharge,
        "fields_filtered": requestedFields.toList(),
        "message": "Usage charge successfully retrieved with filtered fields",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ GetIt service error: $e');
      rethrow;
    }
  }

  // Standard request using GetIt service
  Future<Map<String, dynamic>> _handleStandardRequest(
      int recurringApplicationChargeId, int id) async {
    final service = GetIt.I.get<UsageChargeService>();
    final response = await service.getUsageCharge(
      apiVersion: ApiNetwork.apiVersion,
      recurringApplicationChargeId: recurringApplicationChargeId,
      id: id,
    );

    final charge = response.usageCharge;
    if (charge == null) {
      return {
        "status": "error",
        "message": "Usage charge not found or no data returned",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    debugPrint('✅ Successfully retrieved usage charge');

    return {
      "status": "success",
      "usage_charge": charge.toJson(),
      "message": "Usage charge successfully retrieved",
      "timestamp": DateTime.now().toIso8601String(),
    };
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
            name: 'id',
            label: 'Usage Charge ID',
            hint: 'ID of the specific usage charge',
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
