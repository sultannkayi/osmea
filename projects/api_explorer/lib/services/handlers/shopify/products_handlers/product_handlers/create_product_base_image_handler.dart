import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/create_product_base_image_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';

///*******************************************************************
//*********** 🖼️ CREATE PRODUCT BASE IMAGE HANDLER 🖼️ ************
///*******************************************************************

class CreateProductBaseImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle POST requests for creating products with images
    if (method != 'POST') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Create Product Base Image API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract required parameters
      final title = params['title'];
      if (title == null || title.isEmpty) {
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "Product title is required to create a product.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Extract optional parameters
      final bodyHtml = params['body_html'];
      final vendor = params['vendor'];
      final productType = params['product_type'];

      // Handle image attachment - expecting base64 encoded string
      List<Image> images = [];
      final imageAttachment = params['image_attachment'];
      if (imageAttachment != null && imageAttachment.isNotEmpty) {
        try {
          // Clean and validate base64 format
          final cleanedImageAttachment = _processBase64(imageAttachment);
          images.add(Image(attachment: cleanedImageAttachment));
        } catch (e) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Invalid image format",
            "details":
                "Image attachment must be a valid base64 encoded string. ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      // Create the product request
      final productRequest = CreateProductBaseImageRequest(
        product: Product(
          title: title,
          bodyHtml: bodyHtml,
          vendor: vendor,
          productType: productType,
          images: images.isNotEmpty ? images : null,
        ),
      );

      // Call the API method to create product with base image
      final response = await GetIt.I<ProductService>().createProductBaseImage(
        apiVersion: ApiNetwork.apiVersion,
        model: productRequest,
      );

      // Return success response with created product data
      return {
        "status": "success",
        "message": "Product created successfully with base image",
        "data": response.toJson(),
        "product_info": {
          "id": response.product?.id,
          "title": response.product?.title,
          "images_count": response.product?.images?.length ?? 0,
          "has_image": response.product?.image != null,
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
          "details": "Authentication required to create products.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('403')) {
        statusCode = 403;
        return {
          "status": "error",
          "statusCode": 403,
          "message": "Forbidden",
          "details": "You don't have permission to create products.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('422')) {
        statusCode = 422;
        return {
          "status": "error",
          "statusCode": 422,
          "message": "Unprocessable Entity",
          "details":
              "Product validation failed. Please check your data and image format.",
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
        "message": "Failed to create product: $errorMessage",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  /// Helper method to process and validate base64 string
  String _processBase64(String str) {
    try {
      // Clean the string by removing whitespace and newlines
      final cleanedStr = str.replaceAll(RegExp(r'\s+'), '');

      // Check if it's empty after cleaning
      if (cleanedStr.isEmpty) {
        throw Exception("Base64 string is empty after cleaning");
      }

      // Add proper padding if missing
      String paddedStr = cleanedStr;
      while (paddedStr.length % 4 != 0) {
        paddedStr += '=';
      }

      // Validate base64 pattern
      final base64Pattern = RegExp(r'^[A-Za-z0-9+/]*={0,2}$');
      if (!base64Pattern.hasMatch(paddedStr)) {
        throw Exception("Invalid base64 pattern");
      }

      // Try to decode to ensure validity
      base64Decode(paddedStr);

      return paddedStr;
    } catch (e) {
      throw Exception("Invalid base64 format: ${e.toString()}");
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'title',
            label: 'Product Title',
            hint: 'The name of the product',
            isRequired: true,
          ),
          const ApiField(
            name: 'body_html',
            label: 'Product Description',
            hint: 'HTML description of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'vendor',
            label: 'Vendor',
            hint: 'The vendor/manufacturer of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'product_type',
            label: 'Product Type',
            hint: 'The type/category of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'image_attachment',
            label: 'Image Attachment',
            hint:
                'Base64 encoded image string (e.g., /9j/4AAQSkZJRgABAQAAAQABAAD/...)',
            isRequired: false,
          ),
        ],
      };

  /// 📊 Get handler information
  static Map<String, dynamic> getHandlerInfo() {
    return {
      "handler_name": "CreateProductBaseImageHandler",
      "description":
          "Creates a new product with a base64 encoded image attachment",
      "supported_methods": ["POST"],
      "required_parameters": ["title"],
      "optional_parameters": [
        "body_html",
        "vendor",
        "product_type",
        "image_attachment"
      ],
      "api_endpoint": "/api/{api_version}/products.json",
      "image_requirements": {
        "format": "Base64 encoded string",
        "supported_formats": ["JPEG", "PNG", "GIF", "WebP"],
        "max_size": "20MB (recommended)",
        "note":
            "Image should be encoded without data URL prefix (data:image/jpeg;base64,)"
      },
      "examples": {
        "basic_product_with_image": {
          "method": "POST",
          "parameters": {
            "title": "Stylish T-Shirt",
            "body_html":
                "<p>A comfortable cotton t-shirt with beautiful design</p>",
            "vendor": "Fashion Brand",
            "product_type": "Apparel",
            "image_attachment":
                "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAABAAEDASIAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAv/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAX/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwCdABmX/9k="
          }
        },
        "simple_product_no_image": {
          "method": "POST",
          "parameters": {
            "title": "Simple Product",
            "body_html": "<p>A basic product without image</p>",
            "vendor": "Generic Brand",
            "product_type": "General"
          }
        }
      }
    };
  }
}
