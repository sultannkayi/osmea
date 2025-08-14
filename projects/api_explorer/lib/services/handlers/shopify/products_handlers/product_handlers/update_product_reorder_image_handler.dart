import 'dart:convert';
import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart'
    show ProductService;
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/update_product_reorder_image_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
//*********** 🔄 UPDATE PRODUCT REORDER IMAGE HANDLER 🔄 ***********
///*******************************************************************

class UpdateProductReorderImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle PUT requests for reordering product images
    if (method != 'PUT') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Update Product Reorder Image API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract required parameters
      final productId = params['product_id'];
      if (productId == null || productId.toString().isEmpty) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "Product ID is required to reorder product images.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Extract image reorder data (required for reordering images)
      final String? imagesParam = params['images'];
      List<req.Image>? images;

      if (imagesParam == null || imagesParam.isEmpty) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details":
              "Images parameter is required for reordering product images.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse the images parameter - it should be a JSON string
      dynamic parsedImages;
      try {
        parsedImages = jsonDecode(imagesParam);
      } catch (e) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details":
              "Invalid JSON format in images parameter. Please provide valid JSON.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Handle different types of image input for reordering
      if (parsedImages is List) {
        images = <req.Image>[];
        for (var item in parsedImages) {
          if (item is Map<String, dynamic>) {
            // If it's a map, expect id and position
            final id = item['id'];
            final position = item['position'];

            if (id == null || position == null) {
              return {
                "status": "error",
                "statusCode": 400,
                "message": "Bad Request",
                "details":
                    "Each image must have both 'id' and 'position' fields for reordering.",
                "timestamp": DateTime.now().toIso8601String(),
              };
            }

            images.add(req.Image(
              id: id is int ? id : int.tryParse(id.toString()),
              position: position is int
                  ? position
                  : int.tryParse(position.toString()),
            ));
          } else {
            return {
              "status": "error",
              "statusCode": 400,
              "message": "Bad Request",
              "details":
                  "Each image item must be an object with 'id' and 'position' fields.",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }
        }
      } else if (parsedImages is Map<String, dynamic>) {
        // Single image object
        final id = parsedImages['id'];
        final position = parsedImages['position'];

        if (id == null || position == null) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Bad Request",
            "details":
                "Image must have both 'id' and 'position' fields for reordering.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        images = [
          req.Image(
            id: id is int ? id : int.tryParse(id.toString()),
            position:
                position is int ? position : int.tryParse(position.toString()),
          )
        ];
      } else {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details":
              "Images parameter must be an array of image objects with 'id' and 'position' fields.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Validate that all images have valid IDs and positions
      for (var image in images) {
        if (image.id == null || image.position == null) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Bad Request",
            "details":
                "All images must have valid numeric 'id' and 'position' values.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      // Extract API version - use ApiNetwork.apiVersion instead of extracting from params
      // This aligns with the standard pattern used throughout the codebase

      // Create the request object
      final request = req.UpdateProductReorderImageRequest(
        product: req.Product(
          id: int.tryParse(productId.toString()),
          images: images,
        ),
      );

      // Get the product service from dependency injection
      final productService = GetIt.instance<ProductService>();

      // Make the API call
      final response = await productService.updateProductReorderImage(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId.toString(),
        model: request,
      );

      // Return successful response
      return {
        "status": "success",
        "statusCode": 200,
        "message": "Product images reordered successfully",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle specific error cases
      final errorMessage = e.toString().toLowerCase();
      int statusCode = 500;

      if (errorMessage.contains('401') ||
          errorMessage.contains('unauthorized')) {
        statusCode = 401;
        return {
          "status": "error",
          "statusCode": 401,
          "message": "Unauthorized access",
          "details": "Authentication required to reorder product images.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('403')) {
        statusCode = 403;
        return {
          "status": "error",
          "statusCode": 403,
          "message": "Forbidden",
          "details":
              "You don't have permission to reorder images for this product.",
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
              "The image reorder data could not be processed. Please check the image IDs and position values.",
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
            "An unexpected error occurred while reordering product images: $errorMessage",
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
            hint: 'The unique identifier of the product to reorder images for',
            isRequired: true,
          ),
          const ApiField(
            name: 'images',
            label: 'Images to Reorder',
            hint:
                '''JSON array of image objects. Each image must have "id" and "position" fields.

Example (multiple images):
[
  {"id": 850703190, "position": 1},
  {"id": 562641783, "position": 2}
]

Example (single image):
{"id": 850703190, "position": 1}

• id: Image ID (number)
• position: New position for the image (number, starting from 1)''',
            isRequired: true,
          ),
        ],
      };
}
