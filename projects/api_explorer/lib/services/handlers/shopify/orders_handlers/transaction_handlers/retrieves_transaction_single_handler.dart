import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/transaction/abstract/transaction_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class GetTransactionSingleHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'GET':
        final String apiVersion =
            params['api_version'] ?? ApiNetwork.apiVersion;
        final String? orderId = params['order_id'];
        final String? transactionId = params['transaction_id'];
        final String? fields = params['fields'];
        final String? inShopCurrency = params['in_shop_currency'];

        if (orderId == null ||
            orderId.isEmpty ||
            transactionId == null ||
            transactionId.isEmpty) {
          return {
            "status": "error",
            "message": "Order ID and Transaction ID are required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        try {
          final response =
              await GetIt.I.get<TransactionService>().getTransactionSingle(
                    apiVersion: apiVersion,
                    orderId: orderId,
                    transactionId: transactionId,
                    fields: fields,
                    in_shop_currency: inShopCurrency,
                  );
          return response.toJson();
        } catch (e) {
          return {
            "status": "error",
            "message": "Failed to get transaction: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "error":
              "Method $method not supported for Get Transaction Single API",
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
              name: 'transaction_id',
              label: 'Transaction ID',
              hint: 'Transaction ID'),
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
