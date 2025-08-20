import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/datas/currencies/abstract/currencies_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/material.dart';

class ListAllCurrenciesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error': 'Method $method not supported for List All Currencies API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final apiVersion = params['api_version'] ?? 'v3';

      debugPrint('🔍 Listing all currencies with API version: $apiVersion');

      final service = WooNetwork.getIt.get<CurrenciesService>();
      final response = await service.listAllCurrencies(
        apiVersion: apiVersion,
      );

      debugPrint('✅ Successfully retrieved ${response.length} currencies');

      return {
        'success': true,
        'data': response.map((item) => item.toJson()).toList(),
        'message': 'Currencies list retrieved successfully',
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      String errorMessage = 'Failed to retrieve currencies list';
      Map<String, dynamic> errorDetails = {};
      
      // Extract more specific error information if possible
      if (e.toString().contains('DioException') || e.toString().contains('DioError')) {
        errorMessage = 'Network error occurred while retrieving currencies';
        errorDetails['type'] = 'network_error';
      } else {
        errorDetails['type'] = 'unknown_error';
      }
      
      return {
        'success': false,
        'error': e.toString(),
        'error_details': errorDetails,
        'message': '$errorMessage: $e',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'API version (default: v3)',
            isRequired: false,
          ),
        ],
      };
}
