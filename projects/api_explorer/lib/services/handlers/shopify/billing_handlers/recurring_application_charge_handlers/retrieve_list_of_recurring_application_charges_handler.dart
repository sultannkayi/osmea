import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/billing/recurring_application_charge/abstract/recurring_application_charge_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ********** 📋 RETRIEVE LIST OF RECURRING APPLICATION CHARGES HANDLER 📋 ****
/// ******************************************************************

class RetrieveListOfRecurringApplicationChargesHandler
    implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, dynamic> params) async {
    try {
      if (method == 'GET') {
        // Parse parameters and ensure empty strings are treated as null
        final fieldsParam = params['fields'] as String?;
        String? fields =
            (fieldsParam?.trim().isEmpty ?? true) ? null : fieldsParam?.trim();

        String? sinceId = params['since_id'] as String?;
        if (sinceId?.trim().isEmpty ?? true) {
          sinceId = null; // Convert empty string to null
        }

        debugPrint('🔧 Parameters: fields=$fields, since_id=$sinceId');

        // Use GetIt service for consistent authentication and approach
        if (fields != null) {
          return await _handleFieldFiltering(fields, sinceId);
        }

        // Standard request using the GetIt service
        return await _handleStandardRequest(sinceId);
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
        "message":
            "Failed to fetch recurring application charges: ${e.toString()}",
        "apiVersion": ApiNetwork.apiVersion,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Handle field filtering using GetIt service with post-processing
  Future<Map<String, dynamic>> _handleFieldFiltering(
      String fields, String? sinceId) async {
    debugPrint('📌 Using GetIt service for field filtering: fields=$fields');

    try {
      final service = GetIt.I.get<RecurringApplicationChargeService>();
      final response = await service.getRecurringApplicationCharges(
        apiVersion: ApiNetwork.apiVersion,
        sinceId: sinceId,
      );

      final charges = response.recurringApplicationCharges ?? [];
      debugPrint('📊 Received ${charges.length} recurring application charges');

      if (charges.isEmpty) {
        return {
          "status": "success",
          "recurring_application_charges": [],
          "count": 0,
          "message": "No recurring application charges found",
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
          '✅ Successfully retrieved and filtered ${filteredCharges.length} recurring application charges. Fields: ${requestedFields.join(', ')}');

      return {
        "status": "success",
        "recurring_application_charges": filteredCharges,
        "count": filteredCharges.length,
        "fields_filtered": requestedFields.toList(),
        "message":
            "Recurring application charges successfully retrieved with filtered fields",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ GetIt service error: $e');
      return {
        "status": "error",
        "message":
            "Failed to retrieve recurring application charges with field filtering: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Standard request using the GetIt service
  Future<Map<String, dynamic>> _handleStandardRequest(String? sinceId) async {
    debugPrint('📌 Using standard GetIt service approach');

    final service = GetIt.I.get<RecurringApplicationChargeService>();
    final response = await service.getRecurringApplicationCharges(
      apiVersion: ApiNetwork.apiVersion,
      sinceId: sinceId,
    );

    debugPrint(
        '📊 Received ${response.recurringApplicationCharges?.length ?? 0} charges');

    return {
      "status": "success",
      "recurring_application_charges": response.recurringApplicationCharges
              ?.map((c) => c.toJson())
              .toList() ??
          [],
      "count": response.recurringApplicationCharges?.length ?? 0,
      "message": "Recurring application charges successfully retrieved",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint:
                'Comma-separated list of fields to include (e.g., id,name,price)',
            isRequired: false,
          ),
          const ApiField(
            name: 'since_id',
            label: 'Since ID',
            hint: 'Show charges after this ID (for pagination)',
            isRequired: false,
          ),
        ],
      };
}
