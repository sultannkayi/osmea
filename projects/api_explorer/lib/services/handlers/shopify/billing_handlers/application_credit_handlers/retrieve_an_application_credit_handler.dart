import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/billing/application_credit/abstract/application_credit_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ************* 🔍 RETRIEVE AN APPLICATION CREDIT HANDLER 🔍 ********
/// ******************************************************************

class RetrieveAnApplicationCreditHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, dynamic> params) async {
    try {
      if (method == 'GET') {
        // Get credit ID from params and validate
        final idStr = params['id'] as String?;
        final fieldsParam = params['fields'] as String?;

        if (idStr == null || idStr.isEmpty) {
          return {
            "status": "error",
            "message": "Application Credit ID is required",
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
            "message": "Invalid Application Credit ID: must be a number",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (fieldsParam != null && fieldsParam.trim().isNotEmpty) {
          debugPrint(
              '📌 Using direct API call for field filtering: fields=$fieldsParam, id=$id');
          return await _handleFieldFiltering(id, fieldsParam);
        } else {
          debugPrint(
              '📌 Using standard model-based approach for ID=$id (no fields filtering)');
          return await _handleStandardRequest(id);
        }
      }

      return {
        "status": "error",
        "message": "Method $method not supported. Use GET instead.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error fetching application credit: ${e.toString()}');
      return {
        "status": "error",
        "message": "Failed to retrieve application credit: ${e.toString()}",
        "requestDetails": {
          "apiVersion": ApiNetwork.apiVersion,
          "id": params['id'],
        },
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
            name: 'id',
            label: 'Application Credit ID',
            hint: 'ID of the specific application credit',
            isRequired: true,
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint:
                'Comma-separated list of fields to include (e.g., id,amount,description)',
            isRequired: false,
          ),
        ],
      };

  Future<Map<String, dynamic>> _handleFieldFiltering(
      int id, String fieldsParam) async {
    debugPrint(
        '📌 Using GetIt service for field filtering: fields=$fieldsParam');

    try {
      final service = GetIt.I.get<ApplicationCreditService>();
      final response = await service.getApplicationCredit(
        apiVersion: ApiNetwork.apiVersion,
        id: id,
      );

      final credit = response.applicationCredit;
      if (credit == null) {
        return {
          "status": "error",
          "message": "Application credit not found or no data returned",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse the fields parameter and filter the response
      final requestedFields =
          fieldsParam.split(',').map((f) => f.trim()).toSet();
      final fullJson = credit.toJson();

      // Create a new map with only the requested fields
      final filteredCredit = Map<String, dynamic>.fromEntries(fullJson.entries
          .where((entry) => requestedFields.contains(entry.key)));

      debugPrint(
          '✅ Successfully retrieved and filtered application credit. Fields: ${requestedFields.join(', ')}');

      return {
        "status": "success",
        "application_credit": filteredCredit,
        "fields_filtered": requestedFields.toList(),
        "message":
            "Application credit successfully retrieved with filtered fields",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ GetIt service error: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _handleStandardRequest(int id) async {
    final service = GetIt.I.get<ApplicationCreditService>();
    final response = await service.getApplicationCredit(
      apiVersion: ApiNetwork.apiVersion,
      id: id,
    );

    final credit = response.applicationCredit;
    if (credit == null) {
      return {
        "status": "error",
        "message": "Application credit not found or no data returned",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    return {
      "status": "success",
      "application_credit": credit.toJson(),
      "message": "Application credit successfully retrieved",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }
}
