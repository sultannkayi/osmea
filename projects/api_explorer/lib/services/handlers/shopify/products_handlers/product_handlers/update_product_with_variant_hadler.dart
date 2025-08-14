import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/update_product_with_variant_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';

///*******************************************************************
//*********** 🔄 UPDATE PRODUCT WITH VARIANT HANDLER 🔄 ***********
///*******************************************************************

class UpdateProductWithVariantHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle PUT requests for updating product with variants
    if (method != 'PUT') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Update Product With Variant API",
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
          "details": "Product ID is required to update product with variants.",
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

      // Extract product parameters
      final title = params['title'];
      final variantsJson = params['variants'];

      // Validate that at least one field is provided
      if ((title == null || title.isEmpty) &&
          (variantsJson == null || variantsJson.isEmpty)) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details":
              "At least one field (title or variants) is required to update the product.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse variants if provided
      List<req.Variant>? variants;
      if (variantsJson != null && variantsJson.isNotEmpty) {
        try {
          final variantsData = json.decode(variantsJson);
          if (variantsData is List) {
            variants = variantsData
                .map((variantData) => req.Variant.fromJson(variantData))
                .toList();
          }
        } catch (e) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Invalid variants format",
            "details": "Variants must be a valid JSON array. ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      // Create the request object
      final request = req.UpdateProductWithVariantRequest(
        product: req.Product(
          id: parsedProductId,
          title: title?.isNotEmpty == true ? title : null,
          variants: variants,
        ),
      );

      // Call the product service
      final productService = GetIt.I<ProductService>();
      final response = await productService.updateProductWithVariant(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: request,
      );

      // Return success response
      return {
        "status": "success",
        "statusCode": 200,
        "message": "Product with variants updated successfully",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle specific error cases
      String errorMessage = "Failed to update product with variants";
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
            hint: 'ID of the product to update with variants',
            isRequired: true,
          ),
          const ApiField(
            name: 'title',
            label: 'Product Title',
            hint: 'The title of the product (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'variants',
            label: 'Product Variants',
            hint: 'JSON array of variants with id, price, and sku fields',
            isRequired: false,
          ),
        ],
      };
}
