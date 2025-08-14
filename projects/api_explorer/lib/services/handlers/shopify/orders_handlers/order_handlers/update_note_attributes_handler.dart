import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/order/abstract/order_service.dart';
import 'package:apis/network/remote/shopify/orders/order/freezed_model/request/update_note_attributes_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class UpdateNoteAttributesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // Only handle PUT requests for updating note attributes
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
    final name = params['note_attribute_name'];
    final value = params['note_attribute_value'];

    // Validate required parameters
    if (orderId == null || orderId.isEmpty) {
      return {
        "status": "error",
        "message": "Order ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (name == null || name.isEmpty || value == null || value.isEmpty) {
      return {
        "status": "error",
        "message": "Note attribute name and value are required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Create the request model
      final model = UpdateNoteAttributesRequest(
        order: Order(
          id: int.tryParse(orderId),
          noteAttributes: [
            NoteAttribute(
              name: name,
              value: value,
            ),
          ],
        ),
      );

      // Call the order service
      final response = await GetIt.I<OrderService>().updateNoteAttributes(
        apiVersion: apiVersion,
        orderId: orderId,
        model: model,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Note attributes updated successfully",
        "order": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to update note attributes: ${e.toString()}",
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
            name: 'note_attribute_name',
            label: 'Note Attribute Name',
            hint: 'The name of the note attribute',
            isRequired: true,
          ),
          const ApiField(
            name: 'note_attribute_value',
            label: 'Note Attribute Value',
            hint: 'The value of the note attribute',
            isRequired: true,
          ),
        ],
      };
}
