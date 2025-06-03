import 'dart:convert';

import 'package:apis/apis.dart';
import 'package:apis/network/remote/orders/refund/abstract/refund_service.dart';
import 'package:apis/network/remote/orders/refund/freezed_model/request/create_refund_calculate_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class CreateRefundCalculateHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'POST':
        final String apiVersion =
            params['api_version'] ?? ApiNetwork.apiVersion;
        final String? orderId = params['order_id'];
        final String? currency = params['currency'];
        final String? fullRefundStr = params['full_refund'];
        final List<RefundLineItem> refundLineItems = [];

        debugPrint('Calculate Refund Params: ${jsonEncode(params)}');

        if (orderId == null || orderId.isEmpty) {
          return {
            "status": "error",
            "message": "Order ID is required",
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

        bool hasLineItems = false;
        for (String key in params.keys) {
          if (key.startsWith('refund_line_items[') &&
              key.contains('line_item_id')) {
            hasLineItems = true;
            break;
          }
        }

        if (!hasLineItems) {
          return {
            "status": "error",
            "message": "At least one refund line item is required",
            "debug_params": params,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        int index = 0;
        while (true) {
          final String? lineItemIdStr =
              params['refund_line_items[$index].line_item_id'];
          if (lineItemIdStr == null) break;

          final String? quantityStr =
              params['refund_line_items[$index].quantity'];
          final String? restockType =
              params['refund_line_items[$index].restock_type'];

          if (quantityStr == null) {
            return {
              "status": "error",
              "message": "Quantity is required for line item at index $index",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          final int? lineItemId = int.tryParse(lineItemIdStr);
          final int? quantity = int.tryParse(quantityStr);

          if (lineItemId == null || quantity == null) {
            return {
              "status": "error",
              "message": "Invalid number format in line item at index $index",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          refundLineItems.add(RefundLineItem(
            lineItemId: lineItemId,
            quantity: quantity,
            restockType: restockType,
          ));

          index++;
        }

        final bool? fullRefund = fullRefundStr?.toLowerCase() == 'true';

        final model = CreateRefundCalculateRequest(
          refund: Refund(
            currency: currency,
            shipping: Shipping(fullRefund: fullRefund),
            refundLineItems: refundLineItems,
          ),
        );

        try {
          debugPrint('Calculate Request Model: ${jsonEncode(model.toJson())}');
          final response = await GetIt.I
              .get<RefundService>()
              .createRefundCalculate(
                  apiVersion: apiVersion, orderId: orderId, model: model);
          return response.toJson();
        } catch (e) {
          return {
            "status": "error",
            "message": "Failed to calculate refund: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "error":
              "Method $method not supported for Create Calculate Refund API",
        };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(name: 'order_id', label: 'Order ID', hint: 'Order ID'),
          const ApiField(name: 'currency', label: 'Currency', hint: 'Currency'),
          const ApiField(
              name: 'refund_line_items[].line_item_id',
              label: 'Line Item ID',
              hint: 'ID of the line item to refund'),
          const ApiField(
              name: 'refund_line_items[].quantity',
              label: 'Quantity',
              hint: 'Quantity of the line item to refund'),
          const ApiField(
              name: 'refund_line_items[].restock_type',
              label: 'Restock Type',
              hint: '(Optional) Restock type'),
          const ApiField(
              name: 'full_refund',
              label: 'Full Refund Shipping',
              hint: '(Optional) true or false'),
        ],
      };
}
