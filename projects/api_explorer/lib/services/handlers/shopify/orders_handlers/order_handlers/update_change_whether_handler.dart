import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/order/abstract/order_service.dart';
import 'package:apis/network/remote/shopify/orders/order/freezed_model/request/update_change_whether_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class UpdateChangeWhetherHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // Only handle PUT requests for updating marketing preferences
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
    final String? buyerAcceptsMarketingStr = params['buyer_accepts_marketing'];

    // Validate required parameters
    if (orderId == null || orderId.isEmpty) {
      return {
        "status": "error",
        "message": "Order ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (buyerAcceptsMarketingStr == null) {
      return {
        "status": "error",
        "message": "buyer_accepts_marketing parameter is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    final bool buyerAcceptsMarketing =
        buyerAcceptsMarketingStr.toLowerCase() == 'true';

    try {
      // Create the request model
      final model = UpdateChangeWhetherRequest(
        order: Order(
          id: int.tryParse(orderId),
          buyerAcceptsMarketing: buyerAcceptsMarketing,
        ),
      );

      // Call the order service
      final response = await GetIt.I<OrderService>().updateChangeWhether(
        apiVersion: apiVersion,
        orderId: orderId,
        model: model,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Marketing preferences updated successfully",
        "order": response.order?.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to update marketing preferences: ${e.toString()}",
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
            name: 'buyer_accepts_marketing',
            label: 'Buyer Accepts Marketing',
            hint:
                'Whether the buyer accepts marketing communications (true/false)',
            isRequired: true,
          ),
        ],
      };
}
