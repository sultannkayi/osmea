import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/update_product_clear_images_request.dart'
    as req;
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
//********** 📝 UPDATE PRODUCT CLEAR IMAGES HANDLER 📝 ************
///*******************************************************************

class UpdateProductClearImagesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle PUT requests for clearing product images
    if (method != 'PUT') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Update Product Clear Images API",
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
          "details": "Product ID is required to clear product images.",
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

      // Create the request object
      final request = req.UpdateProductClearImagesRequest(
        product: req.Product(
          id: parsedProductId,
          images: [], // Clear images by setting empty array
        ),
      );

      // Call the product service
      final productService = GetIt.I<ProductService>();
      final response = await productService.updateProductClearImages(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: request,
      );

      // Return success response
      return {
        "status": "success",
        "statusCode": 200,
        "message": "Product images cleared successfully",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle specific error cases
      String errorMessage = "Failed to clear product images";
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
            hint: 'ID of the product to clear images for',
            isRequired: true,
          ),
        ],
      };
}
