import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/product/abstract/product_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
//**************** 📄 SINGLE PRODUCT HANDLER 📄 ********************
///*******************************************************************

class SingleProductHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product to retrieve',
            isRequired: true,
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint: 'Comma-separated list of fields to include in the response',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle GET requests for retrieving a single product
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for Single Product API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract required product ID parameter
      final productId = params['product_id'];
      if (productId == null || productId.isEmpty) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "Product ID is required to retrieve a single product.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Extract optional parameters and filter out empty values
      final fields =
          params['fields']?.isNotEmpty == true ? params['fields'] : null;

      // Call the API method to get single product
      final response = await GetIt.I<ProductService>().getProduct(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        fields: fields,
      );

      // Return success response with product data
      return {
        "status": "success",
        "message": "Product retrieved successfully",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Enhanced error handling
      String errorMessage = e.toString();
      int statusCode = 500;

      if (errorMessage.contains('404') ||
          errorMessage.contains('status code of 404')) {
        statusCode = 404;
        return {
          "status": "error",
          "statusCode": 404,
          "message": "Product not found",
          "details":
              "The requested product could not be found. Please check the product ID and try again.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('401')) {
        statusCode = 401;
        return {
          "status": "error",
          "statusCode": 401,
          "message": "Unauthorized access",
          "details": "Authentication required to access product data.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('403')) {
        statusCode = 403;
        return {
          "status": "error",
          "statusCode": 403,
          "message": "Forbidden",
          "details": "Access to this product is not allowed.",
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
      } else if (errorMessage.contains('422')) {
        statusCode = 422;
        return {
          "status": "error",
          "statusCode": 422,
          "message": "Unprocessable Entity",
          "details": "The request contains invalid parameters.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Generic error handling
      return {
        "status": "error",
        "statusCode": statusCode,
        "message": "Failed to retrieve product",
        "details": errorMessage,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  /// 📊 Get handler information
  static Map<String, dynamic> getHandlerInfo() {
    return {
      "handler_name": "SingleProductHandler",
      "description": "Handles single product retrieval operations",
      "supported_methods": ["GET"],
      "required_parameters": ["product_id"],
      "optional_parameters": ["fields"],
      "api_endpoint": "/api/{api_version}/products/{product_id}.json",
      "examples": {
        "basic_request": {
          "method": "GET",
          "parameters": {"product_id": "123456789"}
        },
        "with_fields": {
          "method": "GET",
          "parameters": {
            "product_id": "123456789",
            "fields": "id,title,handle,vendor,product_type"
          }
        }
      }
    };
  }
}
