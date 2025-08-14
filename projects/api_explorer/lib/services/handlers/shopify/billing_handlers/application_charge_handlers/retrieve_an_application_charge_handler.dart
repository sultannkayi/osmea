import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/billing/application_charge/abstract/application_charge_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ************* 🔍 RETRIEVE AN APPLICATION CHARGE HANDLER 🔍 ********
/// ******************************************************************

class RetrieveAnApplicationChargeHandler implements ApiRequestHandler {
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
          "message": "Application Charge ID is required",
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
          "message": "Invalid Application Charge ID: must be a number",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Check if fields filtering is requested
      if (fieldsParam != null && fieldsParam.trim().isNotEmpty) {
        debugPrint(
            '📌 Using GetIt service for field filtering: fields=$fieldsParam, id=$id');
        return await _handleFieldFiltering(id, fieldsParam.trim());
      }

      // Standard path without field filtering
      return await _handleStandardRequest(id);
    } catch (e) {
      debugPrint('❌ Error retrieving application charge: ${e.toString()}');
      String errorMessage = e.toString();
      int statusCode = 500;

      if (errorMessage.contains("status code of")) {
        final regex = RegExp(r"status code of (\d+)");
        final match = regex.firstMatch(errorMessage);
        if (match != null) {
          statusCode = int.tryParse(match.group(1) ?? "500") ?? 500;
        }
      }

      String troubleshootingTip = "";
      if (statusCode == 400) {
        troubleshootingTip =
            "Bad request. Check if the API version '${ApiNetwork.apiVersion}' is valid and the application charge ID exists.";
      } else if (statusCode == 404) {
        troubleshootingTip =
            "Application charge not found. Verify the charge ID exists.";
      } else if (statusCode == 403) {
        troubleshootingTip = "This may be due to insufficient permissions. "
            "Ensure your API credentials have proper access to billing features.";
      } else if (statusCode == 401) {
        troubleshootingTip =
            "Authentication failed. Check your API credentials and make sure they're valid.";
      } else {
        troubleshootingTip =
            "An unexpected error occurred. Check connection and retry.";
      }

      return {
        "status": "error",
        "message": "Failed to fetch application charge: $errorMessage",
        "statusCode": statusCode,
        "troubleshooting": troubleshootingTip,
        "requestDetails": {
          "method": method,
          "chargeId": params['id'],
          "apiVersion": ApiNetwork.apiVersion,
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
      final service = GetIt.I.get<ApplicationChargeService>();
      final response = await service.getApplicationCharge(
        apiVersion: ApiNetwork.apiVersion,
        id: id,
      );

      final charge = response.applicationCharge;
      if (charge == null) {
        return {
          "status": "error",
          "message": "Application charge not found or no data returned",
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
          '✅ Successfully retrieved and filtered application charge. Fields: ${requestedFields.join(', ')}');

      return {
        "status": "success",
        "application_charge": filteredCharge,
        "fields_filtered": requestedFields.toList(),
        "message":
            "Application charge successfully retrieved with filtered fields",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ GetIt service error: $e');
      return {
        "status": "error",
        "message":
            "Failed to retrieve application charge with field filtering: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Standard request using GetIt service
  Future<Map<String, dynamic>> _handleStandardRequest(int id) async {
    // Retrieve the application charge by ID
    final service = GetIt.I.get<ApplicationChargeService>();
    final response = await service.getApplicationCharge(
      apiVersion: ApiNetwork.apiVersion,
      id: id,
    );

    final charge = response.applicationCharge;

    if (charge == null) {
      return {
        "status": "error",
        "message": "Application charge not found",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    return {
      "status": "success",
      "application_charge": charge.toJson(),
      "message": "Application charge successfully retrieved",
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
            label: 'Application Charge ID',
            hint: 'ID of the specific application charge',
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
