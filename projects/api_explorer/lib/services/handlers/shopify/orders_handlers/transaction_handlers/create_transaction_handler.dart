import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/transaction/abstract/transaction_service.dart';
import 'package:apis/network/remote/shopify/orders/transaction/freezed_model/request/create_transaction_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class CreateTransactionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'POST':
        final String apiVersion =
            params['api_version'] ?? ApiNetwork.apiVersion;
        final String? orderId = params['order_id'];
        final String? kind = params['kind'];
        final String? amount = params['amount'];
        final String? currency = params['currency'];
        final String? gateway = params['gateway'];
        final String? testStr = params['test'];
        final String? source = params['source'];

        debugPrint('Create Transaction Params: $params');

        if (orderId == null || orderId.isEmpty) {
          return {
            "status": "error",
            "message": "Order ID is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
        if (kind == null || kind.isEmpty) {
          return {
            "status": "error",
            "message": "Kind is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
        if (amount == null || amount.isEmpty) {
          return {
            "status": "error",
            "message": "Amount is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
        if (currency == null || currency.isEmpty) {
          return {
            "status": "error",
            "message": "Currency is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
        if (gateway == null || gateway.isEmpty) {
          return {
            "status": "error",
            "message": "Gateway is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        final bool? test = testStr?.toLowerCase() == 'true';

        final model = CreateTransactionRequest(
          transaction: Transaction(
            kind: kind,
            amount: amount,
            currency: currency,
            gateway: gateway,
            test: test,
            source: source,
          ),
        );

        try {
          final response = await GetIt.I
              .get<TransactionService>()
              .createTransaction(
                  apiVersion: apiVersion, orderId: orderId, model: model);
          return response.toJson();
        } catch (e) {
          return {
            "status": "error",
            "message": "Failed to create transaction: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "error": "Method $method not supported for Create Transaction API",
        };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(name: 'order_id', label: 'Order ID', hint: 'Order ID'),
          const ApiField(name: 'kind', label: 'Kind', hint: 'Transaction kind'),
          const ApiField(name: 'amount', label: 'Amount', hint: 'Amount'),
          const ApiField(name: 'currency', label: 'Currency', hint: 'Currency'),
          const ApiField(name: 'gateway', label: 'Gateway', hint: 'Gateway'),
          const ApiField(
              name: 'test', label: 'Test', hint: '(Optional) true or false'),
          const ApiField(
              name: 'source', label: 'Source', hint: '(Optional) Source'),
        ],
      };
}
