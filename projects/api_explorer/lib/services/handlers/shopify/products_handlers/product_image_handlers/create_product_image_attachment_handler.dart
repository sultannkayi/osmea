import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:apis/network/remote/shopify/products/product_image/freezed_model/request/create_a_new_product_image_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///************** ➕ CREATE PRODUCT IMAGE attachment HANDLER ***************
///**************************************************************

class CreateProductImageAttachmentHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product to attach the image to',
            isRequired: true,
          ),
          const ApiField(
            name: 'src',
            label: 'Image Source URL',
            hint: 'URL of the image to upload',
            isRequired: true,
          ),
          const ApiField(
            name: 'alt',
            label: 'Alt Text',
            hint: 'Alternative text for the image',
            isRequired: false,
          ),
          const ApiField(
            name: 'position',
            label: 'Position',
            hint: 'Position of the image in the product images list',
            isRequired: false,
            type: ApiFieldType.number,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    if (method != 'POST') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only POST is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    final productId = params['product_id'];
    final src = params['src'];

    if (productId == null || src == null) {
      return {
        "status": "error",
        "message": "Missing required fields: product_id and src",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
    try {
      // Validate image URL
      try {
        final uri = Uri.parse(src);
        if (!uri.hasScheme || !uri.hasAuthority) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Invalid image URL format",
            "details":
                "Please provide a valid image URL with scheme (http/https)",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      } catch (e) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Invalid image URL",
          "details": "The provided image URL is malformed: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse the position if provided
      int? position;
      if (params['position'] != null) {
        try {
          position = int.parse(params['position']!);
          if (position < 1) {
            return {
              "status": "error",
              "statusCode": 400,
              "message": "Invalid position value",
              "details": "Position must be a positive integer",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }
        } catch (e) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Invalid position format",
            "details": "Position must be a valid integer",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      // Create request object
      final request = req.CreateANewProductImageRequest(
        image: req.Image(
          src: src.trim(),
          alt: params['alt']?.trim(),
          position: position,
          productId: int.tryParse(productId),
        ),
      );

      final service = GetIt.I<ProductImageService>();
      final response = await service.createProductImage(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: request,
      );

      return {
        "status": "success",
        "statusCode": 201,
        "message": "Product image created successfully",
        "data": {
          "image": response.image?.toJson(),
          "product_id": productId,
          "src": src,
          "position": position,
          "alt": params['alt'],
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      String errorMessage = e.toString();
      int statusCode = 500;

      if (errorMessage.contains('404')) {
        statusCode = 404;
        errorMessage =
            "Product not found. Please verify the product ID exists.";
      } else if (errorMessage.contains('422')) {
        statusCode = 422;
        errorMessage = "Invalid image format or unprocessable request.";
      } else if (errorMessage.contains('401')) {
        statusCode = 401;
        errorMessage = "Unauthorized. Please check API credentials.";
      } else if (errorMessage.contains('429')) {
        statusCode = 429;
        errorMessage = "Rate limit exceeded. Please try again later.";
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
}
