import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/order/abstract/order_service.dart';
import 'package:apis/network/remote/shopify/orders/order/freezed_model/request/update_email_address_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class UpdateEmailAddressHandler implements ApiRequestHandler {
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
            name: 'email',
            label: 'Email Address',
            hint: 'New email address for the order',
            isRequired: true,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // Only handle PUT requests for updating email address
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
    final email = params['email'];

    // Validate required parameters
    if (orderId == null || orderId.isEmpty) {
      return {
        "status": "error",
        "message": "Order ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (email == null || email.isEmpty) {
      return {
        "status": "error",
        "message": "Email address is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Create the request model
      final model = UpdateEmailAddressRequest(
        order: Order(
          id: int.tryParse(orderId),
          email: email,
        ),
      );

      // Call the order service
      final response = await GetIt.I<OrderService>().updateEmailAddress(
        apiVersion: apiVersion,
        orderId: orderId,
        model: model,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Order email address updated successfully",
        "order": response.order?.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to update order email address: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }
}
