import 'package:apis/apis.dart';
import 'package:apis/network/remote/orders/order/abstract/order_service.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_phone_number_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';

import 'package:get_it/get_it.dart';

class UpdatePhoneNumberHandler implements ApiRequestHandler {
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
            name: 'phone',
            label: 'Phone Number',
            hint: 'New phone number for the order',
            isRequired: true,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // Only handle PUT requests for updating phone number
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
    final phone = params['phone'];

    // Validate required parameters
    if (orderId == null || orderId.isEmpty) {
      return {
        "status": "error",
        "message": "Order ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (phone == null || phone.isEmpty) {
      return {
        "status": "error",
        "message": "Phone number is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Create the request model
      final model = UpdatePhoneNumberRequest(
        order: Order(
          id: int.tryParse(orderId),
          phone: phone,
        ),
      );

      // Call the order service
      final response = await GetIt.I<OrderService>().updatePhoneNumber(
        apiVersion: apiVersion,
        orderId: orderId,
        model: model,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Order phone number updated successfully",
        "order": response.order?.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to update order phone number: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }
}
