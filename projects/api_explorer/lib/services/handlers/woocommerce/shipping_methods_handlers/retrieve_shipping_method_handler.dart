import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_methods/abstract/shipping_methods_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RetrieveShippingMethodHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error':
            'Method $method not supported for Retrieve Shipping Method API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final id = params['id'];
      if (id == null || id.isEmpty) {
        return {
          'success': false,
          'error': 'Shipping method ID is required',
          'message': 'Please provide a valid id',
        };
      }

      final apiVersion = params['api_version'] ?? 'v3';

      debugPrint(
          '🔍 Fetching shipping method with ID: $id, API version: $apiVersion');

      final service = WooNetwork.getIt.get<ShippingMethodsService>();
      final response = await service.retrieveShippingMethod(
        id: id,
        apiVersion: apiVersion,
      );

      debugPrint('✅ Successfully fetched shipping method: ${response.title}');

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Shipping method retrieved successfully',
      };
    } catch (e) {
      debugPrint('❌ Error: $e');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to fetch shipping method: $e',
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
            label: 'Shipping Method ID',
            hint: 'Unique identifier for the shipping method (required)',
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
