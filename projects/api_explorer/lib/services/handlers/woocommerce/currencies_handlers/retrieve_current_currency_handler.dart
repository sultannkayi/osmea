import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/datas/currencies/abstract/currencies_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/material.dart';

class RetrieveCurrentCurrencyHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error':
            'Method $method not supported for Retrieve Current Currency API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final apiVersion = params['api_version'] ?? 'v3';

      debugPrint('🔍 Retrieving current currency with API version: $apiVersion');

      final service = WooNetwork.getIt.get<CurrenciesService>();
      final response = await service.retrieveCurrentCurrency(
        apiVersion: apiVersion,
      );

      debugPrint('✅ Successfully retrieved current currency: ${response.name}');

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Current currency retrieved successfully',
      };
    } catch (e) {
      debugPrint('❌ Error: $e');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve current currency: $e',
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
