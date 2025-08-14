import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/billing/application_credit/abstract/application_credit_service.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ********** 📋 RETRIEVE LIST OF APPLICATION CREDITS HANDLER 📋 ****
/// ******************************************************************

class RetrieveListOfApplicationCreditsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, dynamic> params) async {
    try {
      if (method == 'GET') {
        // Parse parameters
        final fieldsParam = params['fields'] as String?;

        // CRITICAL FIX: Check explicitly both for null AND empty string
        if (fieldsParam != null && fieldsParam.trim().isNotEmpty) {
          debugPrint(
              '📌 Using direct API call for field filtering: fields=$fieldsParam');
          return await _handleFieldFiltering(fieldsParam);
        } else {
          debugPrint(
              '📌 Using standard model-based approach (no fields filtering)');
          return await _handleStandardRequest();
        }
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
        "message": "Failed to fetch application credits: ${e.toString()}",
        "apiVersion": ApiNetwork.apiVersion,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  // Handle field filtering with proper field filtering implementation
  Future<Map<String, dynamic>> _handleFieldFiltering(String fields) async {
    debugPrint('📌 Using GetIt service for field filtering: fields=$fields');

    final service = GetIt.I.get<ApplicationCreditService>();
    final response = await service.getApplicationCredits(
      apiVersion: ApiNetwork.apiVersion,
    );

    final credits = response.applicationCredits ?? [];
    debugPrint('📊 Received ${credits.length} application credits');

    if (credits.isEmpty) {
      return {
        "status": "success",
        "application_credits": [],
        "count": 0,
        "message": "No application credits found",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Parse the fields parameter and filter each credit
    final requestedFields = fields.split(',').map((f) => f.trim()).toSet();

    final filteredCredits = credits.map((credit) {
      final fullJson = credit.toJson();
      return Map<String, dynamic>.fromEntries(fullJson.entries
          .where((entry) => requestedFields.contains(entry.key)));
    }).toList();

    debugPrint(
        '✅ Successfully retrieved and filtered ${filteredCredits.length} application credits. Fields: ${requestedFields.join(', ')}');

    return {
      "status": "success",
      "application_credits": filteredCredits,
      "count": filteredCredits.length,
      "fields_filtered": requestedFields.toList(),
      "message":
          "Application credits successfully retrieved with filtered fields",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  // Standard request using the GetIt service
  Future<Map<String, dynamic>> _handleStandardRequest() async {
    debugPrint('📌 Using standard GetIt service approach');

    final service = GetIt.I.get<ApplicationCreditService>();
    final response = await service.getApplicationCredits(
      apiVersion: ApiNetwork.apiVersion,
    );

    return {
      "status": "success",
      "application_credits":
          response.applicationCredits?.map((c) => c.toJson()).toList() ?? [],
      "count": response.applicationCredits?.length ?? 0,
      "message": "Application credits successfully retrieved",
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
                'Comma-separated list of fields to include (e.g., id,amount,description)',
            isRequired: false,
          ),
        ],
      };
}
