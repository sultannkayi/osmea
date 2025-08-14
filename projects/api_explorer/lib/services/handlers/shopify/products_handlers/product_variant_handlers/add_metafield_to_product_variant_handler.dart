import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******** 🏷️ ADD METAFIELD TO PRODUCT VARIANT HANDLER 🏷️ ********
///*******************************************************************

class AddMetafieldToProductVariantHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for adding metafield to variant
    if (method == 'PUT') {
      try {
        // Extract required parameters
        final variantId = params['variant_id'];
        final namespace = params['namespace'];
        final key = params['key'];
        final value = params['value'];

        if (variantId == null || variantId.isEmpty) {
          return {
            "status": "error",
            "message": "variant_id parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (namespace == null || namespace.isEmpty) {
          return {
            "status": "error",
            "message": "namespace parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (key == null || key.isEmpty) {
          return {
            "status": "error",
            "message": "key parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (value == null || value.isEmpty) {
          return {
            "status": "error",
            "message": "value parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Extract optional parameters
        final valueType = params['value_type'];

        // Note: Adding metafields directly to variants is typically done through
        // the Metafield API, not the variant API. For now, we'll return an informative message.
        // If you need to update the variant itself, use updateProductVariant instead.

        return {
          "status": "info",
          "message":
              "Adding metafields to product variants should be done through the Metafield API, not the Product Variant API. Please use the appropriate metafield endpoints.",
          "suggested_action":
              "Use POST /admin/api/{api_version}/variants/{variant_id}/metafields.json instead",
          "variant_id": variantId,
          "metafield_data": {
            "namespace": namespace,
            "key": key,
            "value": value,
            "value_type": valueType ?? "string"
          },
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Handle errors and return error response
        return {
          "status": "error",
          "message":
              "Failed to add metafield to product variant: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // 🚫 Return error for unsupported methods
    return {
      "status": "error",
      "message": "Only PUT method is supported for adding metafield to variant",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'variant_id',
            label: 'Variant ID',
            hint: 'ID of the product variant to add metafield to',
            isRequired: true,
          ),
          const ApiField(
            name: 'namespace',
            label: 'Metafield Namespace',
            hint: 'Namespace for the metafield (e.g., "custom")',
            isRequired: true,
          ),
          const ApiField(
            name: 'key',
            label: 'Metafield Key',
            hint: 'Key for the metafield (e.g., "material")',
            isRequired: true,
          ),
          const ApiField(
            name: 'value',
            label: 'Metafield Value',
            hint: 'Value for the metafield (e.g., "cotton")',
            isRequired: true,
          ),
          const ApiField(
            name: 'value_type',
            label: 'Value Type',
            hint: 'Type of the metafield value (e.g., "string", "integer")',
            isRequired: false,
          ),
        ],
      };
}
