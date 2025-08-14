import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart'
    show ProductService;
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/update_product_add_image_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:apis/apis.dart';

///*******************************************************************
//*********** 🖼️ UPDATE PRODUCT ADD IMAGE HANDLER 🖼️ ************
///*******************************************************************

class UpdateProductAddImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    // Only handle PUT requests for updating products with images
    if (method != 'PUT') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Update Product Add Image API",
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
          "details": "Product ID is required to update a product.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Extract image data (required for adding images)
      final dynamic imagesParam = params['images'];
      List<req.Image>? images;

      if (imagesParam == null) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "At least one image is required to add to the product.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      if (imagesParam is String) {
        // Single image URL
        if (imagesParam.trim().isEmpty) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Invalid image URL",
            "details": "Image URL cannot be empty.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        try {
          images = [req.Image(src: imagesParam.trim())];
        } catch (e) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Invalid image URL format",
            "details": "Image URL must be a valid URL string. ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      } else if (imagesParam is List) {
        // Multiple image URLs
        images = [];
        for (final imageItem in imagesParam) {
          if (imageItem is String && imageItem.trim().isNotEmpty) {
            try {
              images.add(req.Image(src: imageItem.trim()));
            } catch (e) {
              return {
                "status": "error",
                "statusCode": 400,
                "message": "Invalid image URL format",
                "details":
                    "All image URLs must be valid strings. ${e.toString()}",
                "timestamp": DateTime.now().toIso8601String(),
              };
            }
          } else if (imageItem is Map<String, dynamic>) {
            // Handle image object with src property
            final src = imageItem['src'] as String?;
            final id = imageItem['id'] as int?;

            if (src != null && src.trim().isNotEmpty) {
              try {
                images.add(req.Image(id: id, src: src.trim()));
              } catch (e) {
                return {
                  "status": "error",
                  "statusCode": 400,
                  "message": "Invalid image object format",
                  "details":
                      "Image object must contain valid src property. ${e.toString()}",
                  "timestamp": DateTime.now().toIso8601String(),
                };
              }
            }
          }
        }

        if (images.isEmpty) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "No valid images provided",
            "details": "At least one valid image URL is required.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      } else {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Invalid images parameter",
          "details":
              "Images parameter must be a string URL, array of URLs, or array of image objects.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse product ID to integer if needed
      int? parsedProductId;
      try {
        parsedProductId = int.parse(productId.toString());
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
        images: images,
      );

      final request = req.UpdateProductAddImageRequest(product: product);

      // Call the API method to update product with images
      final response = await GetIt.I<ProductService>().updateProductAddImage(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId.toString(),
        model: request,
      );

      // Return success response with updated product data
      return {
        "status": "success",
        "message": "Product updated successfully with new images",
        "data": response.toJson(),
        "product_info": {
          "id": response.product?.id,
          "title": response.product?.title,
          "vendor": response.product?.vendor,
          "product_type": response.product?.productType,
          "images_count": response.product?.images?.length ?? 0,
          "has_images": (response.product?.images?.length ?? 0) > 0,
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
              "The product data could not be processed. Please check the image URLs and product information.",
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
            "An unexpected error occurred while updating the product: $errorMessage",
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
            name: 'images',
            label: 'Images',
            hint: 'Image URL(s) or image object(s) to add to the product',
            isRequired: true,
          ),
        ],
      };
}
