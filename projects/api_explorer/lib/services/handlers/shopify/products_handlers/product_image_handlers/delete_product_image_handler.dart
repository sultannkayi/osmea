import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///*************** 🗑️ DELETE PRODUCT IMAGE *********************
///**************************************************************

class DeleteProductImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle DELETE requests for deleting product images
    if (method != 'DELETE') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only DELETE is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract required parameters
    final productId = params['product_id'];
    final imageId = params['image_id'];

    // Validate required parameters
    if (productId == null || productId.isEmpty) {
      return {
        "status": "error",
        "message": "Product ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (imageId == null || imageId.isEmpty) {
      return {
        "status": "error",
        "message": "Image ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Call the API method
      await GetIt.I<ProductImageService>().deleteProductImage(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        imageId: imageId,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Product image deleted successfully",
        "params": {
          "product_id": productId,
          "image_id": imageId,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Error handling with status code detection
      String errorMessage = e.toString();
      int statusCode = 500;

      if (errorMessage.contains('404')) {
        statusCode = 404;
        return {
          "status": "error",
          "statusCode": statusCode,
          "message": "Product or image not found. Please verify the IDs exist.",
          "productId": productId,
          "imageId": imageId,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Default error response
      return {
        "status": "error",
        "statusCode": statusCode,
        "message": "Failed to delete product image: $errorMessage",
        "productId": productId,
        "imageId": imageId,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'The ID of the product containing the image',
            isRequired: true,
          ),
          const ApiField(
            name: 'image_id',
            label: 'Image ID',
            hint: 'The ID of the image to delete',
            isRequired: true,
          ),
        ],
      };
}
