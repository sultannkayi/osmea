import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/update_product_reorder_variants_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';

///*******************************************************************
//*********** 🔄 UPDATE PRODUCT REORDER VARIANTS HANDLER 🔄 *******
///*******************************************************************

class UpdateProductReorderVariantsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle PUT requests for reordering product variants
    if (method != 'PUT') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Update Product Reorder Variants API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract required parameters
      final productId = params['product_id'];
      if (productId == null || productId.isEmpty) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "Product ID is required to reorder product variants.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse product ID to integer if needed
      int? parsedProductId;
      try {
        parsedProductId = int.parse(productId);
      } catch (e) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Invalid product ID format",
          "details": "Product ID must be a valid integer. ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Extract variant IDs parameter
      final variantIdsJson = params['variant_ids'];
      if (variantIdsJson == null || variantIdsJson.isEmpty) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "Variant IDs are required to reorder product variants.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse variant IDs - support multiple formats
      List<req.Variant> variants = [];
      try {
        final trimmed = variantIdsJson.trim();
        List<dynamic> variantIdsData = [];

        // Try different parsing strategies
        if (trimmed.startsWith('[') && trimmed.endsWith(']')) {
          // Handle JSON array format like [123, 456, 789] or ["123", "456"]
          try {
            variantIdsData = json.decode(trimmed) as List;
          } catch (jsonError) {
            // If JSON parsing fails, manually parse the array
            final idsString = trimmed.substring(1, trimmed.length - 1).trim();
            if (idsString.isNotEmpty) {
              variantIdsData = idsString
                  .split(',')
                  .map(
                      (id) => id.trim().replaceAll('"', '').replaceAll("'", ''))
                  .where((id) => id.isNotEmpty)
                  .toList();
            }
          }
        } else if (trimmed.contains(',')) {
          // Handle comma-separated format like "123, 456, 789"
          variantIdsData = trimmed
              .split(',')
              .map((id) => id.trim().replaceAll('"', '').replaceAll("'", ''))
              .where((id) => id.isNotEmpty)
              .toList();
        } else {
          // Handle single value like "123" or 123
          final singleId = trimmed.replaceAll('"', '').replaceAll("'", '');
          if (singleId.isNotEmpty) {
            variantIdsData = [singleId];
          }
        }

        // Convert to Variant objects
        for (final variantId in variantIdsData) {
          if (variantId is int) {
            variants.add(req.Variant(id: variantId));
          } else if (variantId is String) {
            final parsedId = int.tryParse(variantId);
            if (parsedId != null) {
              variants.add(req.Variant(id: parsedId));
            } else {
              throw FormatException("Cannot parse variant ID: '$variantId'");
            }
          } else if (variantId is Map<String, dynamic>) {
            variants.add(req.Variant.fromJson(variantId));
          } else {
            throw FormatException(
                "Invalid variant ID type: ${variantId.runtimeType}");
          }
        }
      } catch (e) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Invalid variant IDs format",
          "details":
              "Variant IDs must be a valid JSON array, comma-separated list, or single value. Examples: [123,456,789] or 123,456,789 or 123. Error: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Validate that we have variants to reorder
      if (variants.isEmpty) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "At least one variant ID is required to reorder variants.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Create the request object
      final request = req.UpdateProductReorderVariantsRequest(
        product: req.Product(
          id: parsedProductId,
          variants: variants,
        ),
      );

      // Call the product service
      final productService = GetIt.I<ProductService>();
      final response = await productService.updateProductReorderVariants(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: request,
      );

      // Return success response
      return {
        "status": "success",
        "statusCode": 200,
        "message": "Product variants reordered successfully",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle specific error cases
      String errorMessage = "Failed to reorder product variants";
      int statusCode = 500;

      if (e.toString().contains('401') ||
          e.toString().toLowerCase().contains('unauthorized')) {
        statusCode = 401;
        errorMessage = "Unauthorized";
      } else if (e.toString().contains('403') ||
          e.toString().toLowerCase().contains('forbidden')) {
        statusCode = 403;
        errorMessage = "Forbidden";
      } else if (e.toString().contains('404') ||
          e.toString().toLowerCase().contains('not found')) {
        statusCode = 404;
        errorMessage = "Product not found";
      } else if (e.toString().contains('422') ||
          e.toString().toLowerCase().contains('unprocessable')) {
        statusCode = 422;
        errorMessage = "Unprocessable Entity";
      } else if (e.toString().contains('429') ||
          e.toString().toLowerCase().contains('too many requests')) {
        statusCode = 429;
        errorMessage = "Too Many Requests";
      }

      return {
        "status": "error",
        "statusCode": statusCode,
        "message": errorMessage,
        "details": e.toString(),
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
            hint: 'ID of the product to reorder variants for',
            isRequired: true,
          ),
          const ApiField(
            name: 'variant_ids',
            label: 'Variant IDs',
            hint:
                'Variant IDs in the desired order. Formats: [123,456,789] or 123,456,789 or 123 or ["123","456","789"]',
            isRequired: true,
          ),
        ],
      };
}
