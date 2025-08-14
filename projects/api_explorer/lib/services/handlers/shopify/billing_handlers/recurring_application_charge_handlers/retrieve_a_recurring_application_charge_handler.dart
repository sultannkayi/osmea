import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/billing/recurring_application_charge/abstract/recurring_application_charge_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ************* 🔍 RETRIEVE A RECURRING APPLICATION CHARGE HANDLER 🔍 ********
/// ******************************************************************

class RetrieveARecurringApplicationChargeHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, dynamic> params) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported. Use GET instead.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Get charge ID from params and validate
      final idStr = params['id'] as String?;
      final fieldsParam = params['fields'] as String?;

      if (idStr == null || idStr.isEmpty) {
        return {
          "status": "error",
          "message": "Recurring Application Charge ID is required",
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
          "message":
              "Invalid Recurring Application Charge ID: must be a number",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // When fields parameter is provided, use server-side filtering
      if (fieldsParam != null && fieldsParam.trim().isNotEmpty) {
        return await _handleFieldFiltering(id, fieldsParam.trim());
      }

      // Standard path without field filtering
      return await _handleStandardRequest(id);
    } catch (e) {
      debugPrint(
          '❌ Error fetching recurring application charge: ${e.toString()}');
      return {
        "status": "error",
        "message":
            "Failed to retrieve recurring application charge: ${e.toString()}",
        "requestDetails": {
          "apiVersion": ApiNetwork.apiVersion,
          "id": params['id'],
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Handle field filtering using GetIt service with post-processing
  Future<Map<String, dynamic>> _handleFieldFiltering(
      int id, String fields) async {
    debugPrint('📌 Using GetIt service for field filtering: fields=$fields');

    try {
      final service = GetIt.I.get<RecurringApplicationChargeService>();
      final response = await service.getRecurringApplicationCharge(
        apiVersion: ApiNetwork.apiVersion,
        id: id,
      );

      final charge = response.recurringApplicationCharge;
      if (charge == null) {
        return {
          "status": "error",
          "message":
              "Recurring application charge not found or no data returned",
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
          '✅ Successfully retrieved and filtered recurring application charge. Fields: ${requestedFields.join(', ')}');

      return {
        "status": "success",
        "recurring_application_charge": filteredCharge,
        "fields_filtered": requestedFields.toList(),
        "message":
            "Recurring application charge successfully retrieved with filtered fields",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ GetIt service error: $e');
      return {
        "status": "error",
        "message":
            "Failed to retrieve recurring application charge with field filtering: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Standard request using GetIt service
  Future<Map<String, dynamic>> _handleStandardRequest(int id) async {
    final service = GetIt.I.get<RecurringApplicationChargeService>();
    final response = await service.getRecurringApplicationCharge(
      apiVersion: ApiNetwork.apiVersion,
      id: id,
    );

    final charge = response.recurringApplicationCharge;
    if (charge == null) {
      return {
        "status": "error",
        "message": "Recurring application charge not found or no data returned",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    debugPrint('✅ Successfully retrieved recurring application charge');

    return {
      "status": "success",
      "recurring_application_charge": charge.toJson(),
      "message": "Recurring application charge successfully retrieved",
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
            label: 'Recurring Application Charge ID',
            hint: 'ID of the specific recurring application charge',
            isRequired: true,
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint:
                'Comma-separated list of fields to include (e.g., id,name,price)',
            isRequired: false,
          ),
        ],
      };
}
