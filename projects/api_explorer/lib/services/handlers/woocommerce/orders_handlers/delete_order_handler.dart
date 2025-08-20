import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/orders/abstract/orders_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 🗑️ DELETE ORDER HANDLER ********************
///*******************************************************************

class DeleteOrderHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'DELETE') {
      return {
        "status": "error",
        "message": "Method $method not supported for Delete Order API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('order_id') || params['order_id']!.isEmpty) {
      return {
        "status": "error",
        "message": "Order ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse order ID
      final orderIdStr = params['order_id']?.toString() ?? '';
      final orderId = int.tryParse(orderIdStr);
      if (orderId == null || orderId <= 0) {
        return {
          "status": "error",
          "message": "❌ order_id is required and must be a valid number!",
          "params": params,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse optional parameters
      final force = params['force'] == 'true' ? true : null;

      final response = await GetIt.I<OrdersService>().deleteOrder(
        apiVersion: WooNetwork.apiVersion,
        orderId: orderId,
        force: force,
      );

      return {
        "status": "success",
        "message": "Order deleted successfully",
        "order_id": orderId,
        "order": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint("❌ Error: $e");

      return {
        "status": "error",
        "message": "Failed to delete order: ${e.toString()}",
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'order_id',
            label: 'Order ID',
            hint: 'ID of the order to delete',
            isRequired: true,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Whether to bypass trash and force deletion (true/false)',
          ),
        ],
      };
}
