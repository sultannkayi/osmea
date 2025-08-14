import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/update_product_title_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
//************* 📝 UPDATE PRODUCT TITLE HANDLER 📝 *****************
///*******************************************************************

class UpdateProductTitleHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle PUT requests for updating product title
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported for Update Product Title API",
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
          "details": "Product ID is required to update product title.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final title = params['title'];
      if (title == null || title.isEmpty) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "Product title is required to update the product.",
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

      // Create the product request
      final product = req.Product(
        id: parsedProductId,
        title: title,
      );

      final request = req.UpdateProductTitleRequest(product: product);

      // Call the API method to update product title
      final response = await GetIt.I<ProductService>().updateProductTitle(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: request,
      );

      // Return success response with updated product data
      return {
        "status": "success",
        "message": "Product title updated successfully",
        "data": response.toJson(),
        "product_info": {
          "id": response.product?.id,
          "title": response.product?.title,
          "vendor": response.product?.vendor,
          "product_type": response.product?.productType,
          "updated_at": response.product?.updatedAt,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Enhanced error handling
      String errorMessage = e.toString();
      int statusCode = 500;

      if (errorMessage.contains('400') ||
          errorMessage.contains('Bad Request')) {
        statusCode = 400;
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details":
              "Invalid product data provided. Please check your input parameters.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('401')) {
        statusCode = 401;
        return {
          "status": "error",
          "statusCode": 401,
          "message": "Unauthorized access",
          "details": "Authentication required to update products.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('403')) {
        statusCode = 403;
        return {
          "status": "error",
          "statusCode": 403,
          "message": "Forbidden",
          "details": "You don't have permission to update this product.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('404')) {
        statusCode = 404;
        return {
          "status": "error",
          "statusCode": 404,
          "message": "Product not found",
          "details": "The specified product does not exist.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('422')) {
        statusCode = 422;
        return {
          "status": "error",
          "statusCode": 422,
          "message": "Unprocessable Entity",
          "details":
              "The product title could not be processed. Please check the title format.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('429')) {
        statusCode = 429;
        return {
          "status": "error",
          "statusCode": 429,
          "message": "Rate limit exceeded",
          "details": "Too many requests. Please try again later.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      return {
        "status": "error",
        "statusCode": statusCode,
        "message": "Internal server error",
        "details":
            "An unexpected error occurred while updating the product title: $errorMessage",
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
            hint: 'The unique identifier of the product to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'title',
            label: 'Product Title',
            hint: 'The new title for the product',
            isRequired: true,
          ),
        ],
      };
}
