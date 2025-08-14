import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/abstract/payment_gateways_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';

class ListAllPaymentGatewaysHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error':
            'Method $method not supported for List All Payment Gateways API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final apiVersion = params['api_version'] ?? 'v3';

      print('🔍 Fetching payment gateways with API version: $apiVersion');

      final service = WooNetwork.getIt.get<PaymentGatewaysService>();
      final response = await service.listAllPaymentGateways(
        apiVersion: apiVersion,
      );

      print('✅ Successfully fetched ${response.length} payment gateways');

      return {
        'success': true,
        'data': response.map((gateway) => gateway.toJson()).toList(),
        'count': response.length,
        'message': 'Payment gateways retrieved successfully',
      };
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to fetch payment gateways: ${e.message}',
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
