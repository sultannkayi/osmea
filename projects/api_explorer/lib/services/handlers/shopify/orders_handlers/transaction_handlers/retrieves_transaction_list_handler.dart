import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/transaction/abstract/transaction_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class GetTransactionListHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'GET':
        final String apiVersion =
            params['api_version'] ?? ApiNetwork.apiVersion;
        final String? orderId = params['order_id'];
        final String? sinceId = params['since_id'];
        final String? fields = params['fields'];
        final String? inShopCurrency = params['in_shop_currency'];

        if (orderId == null || orderId.isEmpty) {
          return {
            "status": "error",
            "message": "Order ID is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        try {
          final response =
              await GetIt.I.get<TransactionService>().getTransactionList(
                    apiVersion: apiVersion,
                    orderId: orderId,
                    since_id: sinceId,
                    fields: fields,
                    in_shop_currency: inShopCurrency,
                  );
          return response.toJson();
        } catch (e) {
          return {
            "status": "error",
            "message": "Failed to get transaction list: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "error": "Method $method not supported for Get Transaction List API",
        };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(name: 'order_id', label: 'Order ID', hint: 'Order ID'),
          const ApiField(
              name: 'since_id',
              label: 'Since ID',
              hint: '(Optional) Return results after this ID'),
          const ApiField(
              name: 'fields',
              label: 'Fields',
              hint: '(Optional) Comma-separated list of fields'),
          const ApiField(
              name: 'in_shop_currency',
              label: 'In Shop Currency',
              hint: '(Optional) true or false'),
        ],
      };
}
