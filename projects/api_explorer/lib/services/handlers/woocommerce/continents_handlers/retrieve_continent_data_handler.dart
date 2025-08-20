import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/datas/continents/abstract/continents_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RetrieveContinentDataHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error': 'Method $method not supported for Retrieve Continent Data API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final code = params['code'];
      if (code == null || code.isEmpty) {
        return {
          'success': false,
          'error': 'Continent code is required',
          'message': 'Please provide a valid continent code',
        };
      }

      final apiVersion = params['api_version'] ?? 'v3';

      debugPrint(
          '🔍 Retrieving continent data for code: $code, API version: $apiVersion');

      final service = WooNetwork.getIt.get<ContinentsService>();
      final response = await service.retrieveContinentData(
        code: code,
        apiVersion: apiVersion,
      );

      debugPrint('✅ Successfully retrieved continent data: ${response.name}');

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Continent data retrieved successfully',
      };
    } catch (e) {
      debugPrint('❌ Error: $e');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve continent data: $e',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'code',
            label: 'Continent Code',
            hint: 'Continent code (e.g., AF, AS, EU, NA, OC, SA)',
            isRequired: true,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'API version (default: v3)',
            isRequired: false,
          ),
        ],
      };
}
