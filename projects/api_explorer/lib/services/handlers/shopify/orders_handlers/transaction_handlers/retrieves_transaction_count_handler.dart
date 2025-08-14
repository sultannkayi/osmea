import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/transaction/abstract/transaction_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class GetTransactionCountHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'GET':
        final String apiVersion =
            params['api_version'] ?? ApiNetwork.apiVersion;
        final String? orderId = params['order_id'];

        if (orderId == null || orderId.isEmpty) {
          return {
            "status": "error",
            "message": "Order ID is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        try {
          final response = await GetIt.I
              .get<TransactionService>()
              .getTransactionCount(apiVersion: apiVersion, orderId: orderId);
          return response.toJson();
        } catch (e) {
          return {
            "status": "error",
            "message": "Failed to get transaction count: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "error": "Method $method not supported for Get Transaction Count API",
        };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(name: 'order_id', label: 'Order ID', hint: 'Order ID'),
        ],
      };
}
