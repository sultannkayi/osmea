import 'package:apis/apis.dart';
import 'package:apis/network/remote/orders/order/abstract/order_service.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_order_tag_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class UpdateOrderTagHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // Only handle PUT requests for updating order tags
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only PUT is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract required parameters
    final String apiVersion = params['api_version'] ?? ApiNetwork.apiVersion;
    final orderId = params['order_id'];
    final tags = params['tags'];

    // Validate required parameters
    if (orderId == null || orderId.isEmpty) {
      return {
        "status": "error",
        "message": "Order ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (tags == null) {
      return {
        "status": "error",
        "message": "Tags are required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Create the request model
      final model = UpdateOrderTagRequest(
        order: Order(
          id: int.tryParse(orderId),
          tags: tags,
        ),
      );

      // Call the order service
      final response = await GetIt.I<OrderService>().updateOrderTags(
        apiVersion: apiVersion,
        orderId: orderId,
        model: model,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Order tags updated successfully",
        "order": response.order?.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to update order tags: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'order_id',
            label: 'Order ID',
            hint: 'The ID of the order to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'tags',
            label: 'Tags',
            hint: 'Comma-separated list of tags',
            isRequired: true,
          ),
        ],
      };
}
