import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/abstract/payment_gateways_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';

class RetrievePaymentGatewayHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error':
            'Method $method not supported for Retrieve Payment Gateway API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final id = params['id'];
      if (id == null || id.isEmpty) {
        return {
          'success': false,
          'error': 'Payment gateway ID is required',
          'message': 'Please provide a valid id',
        };
      }

      final apiVersion = params['api_version'] ?? 'v3';

      print(
          '🔍 Fetching payment gateway with ID: $id, API version: $apiVersion');

      final service = WooNetwork.getIt.get<PaymentGatewaysService>();
      final response = await service.retrievePaymentGateway(
        id: id,
        apiVersion: apiVersion,
      );

      print('✅ Successfully fetched payment gateway: ${response.title}');

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Payment gateway retrieved successfully',
      };
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to fetch payment gateway: ${e.message}',
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
            name: 'id',
            label: 'Payment Gateway ID',
            hint: 'Unique identifier for the payment gateway (required)',
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
