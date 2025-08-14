import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/refund/abstract/refund_service.dart';
import 'package:apis/network/remote/shopify/orders/refund/freezed_model/request/create_refund_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class CreateRefundHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'POST':
        final String apiVersion =
            params['api_version'] ?? ApiNetwork.apiVersion;
        final String? orderId = params['order_id'];

        final String? notifyStr = params['notify'];
        final String? note = params['note'];
        final List<RefundLineItem> refundLineItems = [];

        if (orderId == null || orderId.isEmpty) {
          return {
            "status": "error",
            "message": "Order ID is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        debugPrint('Received params: $params');

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
          final String? locationIdStr =
              params['refund_line_items[$index].location_id'];

          if (quantityStr == null) {
            return {
              "status": "error",
              "message":
                  "Quantity is required for refund line item at index $index",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          final int? lineItemId = int.tryParse(lineItemIdStr);
          final int? quantity = int.tryParse(quantityStr);
          final int? locationId =
              locationIdStr != null ? int.tryParse(locationIdStr) : null;

          if (lineItemId == null || quantity == null) {
            return {
              "status": "error",
              "message":
                  "Invalid number format in refund line item at index $index",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          refundLineItems.add(RefundLineItem(
            lineItemId: lineItemId,
            quantity: quantity,
            restockType: restockType,
            locationId: locationId,
          ));

          index++;
        }

        final bool notify = notifyStr?.toLowerCase() == 'true';

        final model = CreateRefundRequest(
          refund: Refund(
            notify: notify,
            note: note,
            refundLineItems: refundLineItems,
          ),
        );

        try {
          final response = await GetIt.I.get<RefundService>().createRefund(
              apiVersion: apiVersion, orderId: orderId, model: model);
          return response.toJson();
        } catch (e) {
          return {
            "status": "error",
            "message": "Failed to create refund: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "error": "Method $method not supported for Create Refund API",
        };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(name: 'order_id', label: 'Order ID', hint: 'Order ID'),
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
              hint: 'The restock type for the line item'),
          const ApiField(
              name: 'refund_line_items[].location_id',
              label: 'Location ID',
              hint: 'The location ID to restock the item'),
          const ApiField(
              name: 'notify',
              label: 'Notify Customer',
              hint:
                  'Whether to notify the customer about the refund (true/false)'),
          const ApiField(
              name: 'note',
              label: 'Note',
              hint: 'A note associated with the refund'),
        ],
      };
}
