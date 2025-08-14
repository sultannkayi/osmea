import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/update_product_tags_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*************************************************************
//**************** 🏷️ UPDATE PRODUCT TAGS HANDLER 🏷️ *******
///*************************************************************

class UpdateProductTagsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle PUT requests for updating product tags
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported for Update Product Tags API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract required parameters
      final productId = params['product_id'];
      final tags = params['tags'] ?? '';

      if (productId == null || productId.isEmpty) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "Product ID is required to update product tags.",
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
          "details": "Product ID must be a valid integer: $productId",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Process tags input - support multiple formats
      String processedTags = _processTags(tags);

      // Create the request using the JSON structure that matches the API
      final requestJson = {
        "product": {
          "id": parsedProductId,
          "tags": processedTags,
        }
      };

      // Convert to proper request model
      final updateRequest = req.UpdateProductTagsRequest.fromJson(requestJson);

      // Call the API method
      final response = await GetIt.I<ProductService>().updateProductTags(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: updateRequest,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Product tags updated successfully",
        "product": response.product?.toJson(),
        "tags": response.product?.tags,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "statusCode": 500,
        "message": "Failed to update product tags",
        "details": e.toString(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  /// 🔧 Process tags input to handle different formats
  ///
  /// Supports:
  /// - Comma-separated: "tag1,tag2,tag3" → "tag1, tag2, tag3"
  /// - JSON array: '["tag1","tag2","tag3"]' → "tag1, tag2, tag3"
  /// - Single tag: "tag" → "tag"
  /// - Empty/null: "" → ""
  String _processTags(String tags) {
    if (tags.trim().isEmpty) {
      return '';
    }

    final trimmedTags = tags.trim();

    // Check if it's a JSON array format
    if (trimmedTags.startsWith('[') && trimmedTags.endsWith(']')) {
      try {
        // Remove brackets and quotes, split by comma
        final cleanedTags = trimmedTags
            .substring(1, trimmedTags.length - 1) // Remove brackets
            .replaceAll('"', '') // Remove quotes
            .replaceAll("'", '') // Remove single quotes
            .split(',')
            .map((tag) => tag.trim())
            .where((tag) => tag.isNotEmpty)
            .join(', ');

        return cleanedTags;
      } catch (e) {
        // Invalid JSON array format, treat as regular string
        return trimmedTags;
      }
    }

    // Check if it contains commas (comma-separated format)
    if (trimmedTags.contains(',')) {
      // Split by comma, trim each tag, and rejoin with ", "
      final processedTags = trimmedTags
          .split(',')
          .map((tag) => tag.trim())
          .where((tag) => tag.isNotEmpty)
          .join(', ');

      return processedTags;
    }

    // Single tag or already properly formatted
    return trimmedTags;
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'The ID of the product to update tags for',
            isRequired: true,
          ),
          const ApiField(
            name: 'tags',
            label: 'Tags',
            hint: 'Product tags (comma-separated, JSON array, or single tag)',
            isRequired: false,
          ),
        ],
      };
}
