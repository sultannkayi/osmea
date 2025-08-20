import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/orders/abstract/orders_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 🎯 RETRIEVE ORDER HANDLER *******************
///*******************************************************************

class RetrieveOrderHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for Retrieve Order API",
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
      final context =
          params['context']?.isNotEmpty == true ? params['context'] : null;

      final response = await GetIt.I<OrdersService>().retrieveOrder(
        apiVersion: WooNetwork.apiVersion,
        orderId: orderId,
        context: context,
      );

      return {
        "status": "success",
        "message": "Order retrieved successfully",
        "order": response.toJson(),
        "order_id": orderId,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint("❌ Error: $e");

      return {
        "status": "error",
        "message": "Failed to retrieve order: ${e.toString()}",
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
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
            hint: 'ID of the order to retrieve',
            isRequired: true,
          ),
          const ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (view, edit)',
          ),
        ],
      };
}
