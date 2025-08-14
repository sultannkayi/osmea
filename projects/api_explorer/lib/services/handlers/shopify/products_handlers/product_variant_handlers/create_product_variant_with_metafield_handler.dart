import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_variant/abstract/product_variant_service.dart';
import 'package:apis/network/remote/shopify/products/product_variant/freezed_model/request/create_product_variant_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///******* 🏷️ CREATE VARIANT WITH METAFIELD HANDLER 🏷️ *******
///*******************************************************************

class CreateProductVariantWithMetafieldHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle POST requests for creating variant with metafield
    if (method == 'POST') {
      try {
        // Extract required parameters
        final productId = params['product_id'];
        final option1 = params['option1'];
        final namespace = params['namespace'];
        final key = params['key'];
        final value = params['value'];

        if (productId == null || productId.isEmpty) {
          return {
            "status": "error",
            "message": "product_id parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (option1 == null || option1.isEmpty) {
          return {
            "status": "error",
            "message": "option1 parameter is required",
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
        final price = params['price'];

        // 📞 Create variant using standard API versioned method
        final createRequest = CreateProductVariantRequest(
          variant: ProductVariant(
            option1: option1,
            price: price,
          ),
        );

        final response =
            await GetIt.I.get<ProductVariantService>().createProductVariant(
                  apiVersion: ApiNetwork.apiVersion,
                  productId: productId,
                  model: createRequest,
                );

        // ✅ Return successful response with metafield information
        return {
          "status": "success",
          "message":
              "Product variant created successfully. Note: For adding metafields, please use the dedicated Metafield API endpoints after variant creation.",
          "data": response.toJson(),
          "metafieldNote": {
            "namespace": namespace,
            "key": key,
            "value": value,
            "valueType": valueType,
            "suggestion":
                "Use POST /admin/api/{version}/variants/{variant_id}/metafields.json to add metafields to the created variant"
          },
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Handle errors and return error response
        return {
          "status": "error",
          "message": "Failed to create variant with metafield: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // 🚫 Return error for unsupported methods
    return {
      "status": "error",
      "message":
          "Only POST method is supported for creating variant with metafield",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product to create variant for',
            isRequired: true,
          ),
          const ApiField(
            name: 'option1',
            label: 'Option1 (Title)',
            hint: 'Title for the new variant (e.g., "Small", "Red")',
            isRequired: true,
          ),
          const ApiField(
            name: 'price',
            label: 'Price',
            hint: 'Price for the variant (e.g., "19.99")',
            isRequired: false,
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
