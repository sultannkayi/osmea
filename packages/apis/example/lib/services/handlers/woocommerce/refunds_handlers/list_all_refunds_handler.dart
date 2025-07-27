import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/refunds/abstract/refunds_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:dio/dio.dart';

class ListAllRefundsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error': 'Method $method not supported for List All Refunds API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final orderIdStr = params['order_id'];
      if (orderIdStr == null || orderIdStr.isEmpty) {
        return {
          'success': false,
          'error': 'Order ID is required',
          'message': 'Please provide a valid order_id',
        };
      }

      final orderId = int.tryParse(orderIdStr);
      if (orderId == null) {
        return {
          'success': false,
          'error': 'Invalid Order ID format',
          'message': 'Order ID must be a valid integer',
        };
      }

      final apiVersion = params['api_version'] ?? 'v3';

      print(
          '🔍 Listing all refunds for order ID: $orderId, API version: $apiVersion');

      final service = WooNetwork.getIt.get<RefundsService>();
      final response = await service.listAllRefunds(
        orderId: orderId,
        apiVersion: apiVersion,
      );

      print('✅ Successfully retrieved ${response.length} refunds');

      return {
        'success': true,
        'data': response.map((item) => item.toJson()).toList(),
        'message': 'Refunds list retrieved successfully',
      };
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve refunds list: ${e.message}',
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
            name: 'order_id',
            label: 'Order ID',
            hint: 'Order ID to list refunds for (required)',
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
