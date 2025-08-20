import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/datas/continents/abstract/continents_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class ListAllContinentsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error': 'Method $method not supported for List All Continents API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final apiVersion = params['api_version'] ?? 'v3';

      debugPrint('🔍 Listing all continents with API version: $apiVersion');

      final service = WooNetwork.getIt.get<ContinentsService>();
      final response = await service.listAllContinents(
        apiVersion: apiVersion,
      );

      debugPrint('✅ Successfully retrieved ${response.length} continents');

      return {
        'success': true,
        'data': response.map((item) => item.toJson()).toList(),
        'message': 'Continents list retrieved successfully',
      };
    } catch (e) {
      debugPrint('❌ Error: $e');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve continents list: $e',
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
