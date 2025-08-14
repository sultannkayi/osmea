import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/add_metafield_to_product_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
//************ 🏷️ ADD METAFIELD TO PRODUCT HANDLER 🏷️ ************
///*******************************************************************

class AddMetafieldToProductHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    // Only handle PUT requests for adding metafields to existing products
    if (method != 'PUT') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Add Metafield to Product API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract required parameters
      final productId = params['product_id']?.toString();
      final metafieldKey = params['metafield_key']?.toString();
      final metafieldValue = params['metafield_value']?.toString();

      // Validate required parameters
      if (productId == null || productId.isEmpty) {
        return {
          "status": "error",
          "message": "Product ID is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      if (metafieldKey == null || metafieldKey.isEmpty) {
        return {
          "status": "error",
          "message": "Metafield key is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      if (metafieldValue == null || metafieldValue.isEmpty) {
        return {
          "status": "error",
          "message": "Metafield value is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Extract optional parameters with defaults
      final metafieldType =
          params['metafield_type']?.toString() ?? 'single_line_text_field';
      final metafieldNamespace =
          params['metafield_namespace']?.toString() ?? 'global';

      // Validate product ID is a valid integer
      int productIdInt;
      try {
        productIdInt = int.parse(productId);
      } catch (e) {
        return {
          "status": "error",
          "message": "Product ID must be a valid number",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Create metafield object
      final metafield = req.Metafield(
        key: metafieldKey,
        value: metafieldValue,
        valueType: metafieldType,
        namespace: metafieldNamespace,
      );

      // Create the product object with ID and metafields
      final product = req.Product(
        id: productIdInt,
        metafields: [metafield],
      );

      // Create the request model
      final metafieldRequest = req.AddMetafieldToProductRequest(
        product: product,
      );

      // Call the API method
      final response = await GetIt.I<ProductService>().addMetafieldToProduct(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: metafieldRequest,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Metafield added to product successfully",
        "product": response.product?.toJson(),
        "metafield_details": {
          "key": metafieldKey,
          "value": metafieldValue,
          "type": metafieldType,
          "namespace": metafieldNamespace,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to add metafield to product: ${e.toString()}",
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
            name: 'product_id',
            label: 'Product ID',
            hint: 'The ID of the product to add the metafield to',
            isRequired: true,
          ),
          const ApiField(
            name: 'metafield_key',
            label: 'Metafield Key',
            hint: 'The key for the product metafield',
            isRequired: true,
          ),
          const ApiField(
            name: 'metafield_value',
            label: 'Metafield Value',
            hint: 'The value for the product metafield',
            isRequired: true,
          ),
          const ApiField(
            name: 'metafield_type',
            label: 'Metafield Type',
            hint: 'The type of the metafield (default: single_line_text_field)',
            isRequired: false,
          ),
          const ApiField(
            name: 'metafield_namespace',
            label: 'Metafield Namespace',
            hint: 'The namespace for the metafield (default: global)',
            isRequired: false,
          ),
        ],
      };
}
