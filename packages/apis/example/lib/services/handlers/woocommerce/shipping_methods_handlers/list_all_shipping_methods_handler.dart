import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_methods/abstract/shipping_methods_service.dart';
import 'package:apis/network/remote/woocommerce/shipping_methods/freezed_model/response/list_all_shipping_methods_response.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:dio/dio.dart';

class ListAllShippingMethodsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error':
            'Method $method not supported for List All Shipping Methods API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final apiVersion = params['api_version'] ?? 'v3';

      print('🔍 Fetching shipping methods with API version: $apiVersion');

      final service = WooNetwork.getIt.get<ShippingMethodsService>();
      final response = await service.listAllShippingMethods(
        apiVersion: apiVersion,
      );

      print('✅ Successfully fetched ${response.length} shipping methods');

      return {
        'success': true,
        'data': response.map((method) => method.toJson()).toList(),
        'count': response.length,
        'message': 'Shipping methods retrieved successfully',
      };
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to fetch shipping methods: ${e.message}',
      };
    } catch (e) {
      print('❌ Unexpected error: $e');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Unexpected error: $e',
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
