import 'package:apis/apis.dart';
import 'package:apis/network/remote/orders/order/abstract/order_service.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_add_metafield_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class UpdateAddMetafieldHandler implements ApiRequestHandler {
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
            name: 'key',
            label: 'Key',
            hint: 'Metafield key',
            isRequired: true,
          ),
          const ApiField(
            name: 'value',
            label: 'Value',
            hint: 'Metafield value',
            isRequired: true,
          ),
          const ApiField(
            name: 'value_type',
            label: 'Value Type',
            hint: 'Type of the metafield value',
            isRequired: true,
          ),
          const ApiField(
            name: 'namespace',
            label: 'Namespace',
            hint: 'Metafield namespace',
            isRequired: true,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // Only handle PUT requests for updating metafields
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
    final key = params['key'];
    final value = params['value'];
    final valueType = params['value_type'];
    final namespace = params['namespace'];

    // Validate required parameters
    if (orderId == null || orderId.isEmpty) {
      return {
        "status": "error",
        "message": "Order ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (key == null || key.isEmpty) {
      return {
        "status": "error",
        "message": "Key is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (value == null || value.isEmpty) {
      return {
        "status": "error",
        "message": "Value is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (valueType == null || valueType.isEmpty) {
      return {
        "status": "error",
        "message": "Value type is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (namespace == null || namespace.isEmpty) {
      return {
        "status": "error",
        "message": "Namespace is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Create the request model
      final model = UpdateAddMetafieldRequest(
        order: Order(
          metafields: [
            Metafield(
              key: key,
              value: value,
              valueType: valueType,
              namespace: namespace,
            ),
          ],
        ),
      );

      // Call the order service
      final response = await GetIt.I<OrderService>().updateAddMetafield(
        apiVersion: apiVersion,
        orderId: orderId,
        model: model,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Order metafield added successfully",
        "order": response.order?.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to add order metafield: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }
}
