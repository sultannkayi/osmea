import 'package:apis/network/remote/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_product_multi_variants_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';

///*******************************************************************
//*********** 🔢 CREATE PRODUCT MULTI VARIANTS HANDLER 🔢 ********
///*******************************************************************

class CreateProductMultiVariantsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    // Only handle POST requests for creating products with variants
    if (method != 'POST') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Create Product Multi Variants API",
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

      // Handle variants - can be JSON string or already parsed object/array
      List<Variant> variants = [];
      final variantsParam = params['variants'];

      if (variantsParam != null) {
        List<dynamic> variantsData = [];

        if (variantsParam is List) {
          // If it's already a parsed List, use it directly
          variantsData = variantsParam;
        } else if (variantsParam is String && variantsParam.isNotEmpty) {
          // Check if it's a simple comma-separated string and convert it
          if (!variantsParam.trim().startsWith('[') &&
              !variantsParam.trim().startsWith('{')) {
            // Handle simple comma-separated values like "Small, Medium, Large"
            final simpleVariants = variantsParam
                .split(',')
                .map((v) => v.trim())
                .where((v) => v.isNotEmpty)
                .toList();
            if (simpleVariants.isNotEmpty) {
              // Create variants with default price for each option
              final defaultPrice = params['default_price'] ?? '0.00';
              if (!_isValidPrice(defaultPrice)) {
                return {
                  "status": "error",
                  "statusCode": 400,
                  "message": "Bad Request",
                  "details":
                      "When using simple variant format ('$variantsParam'), you must provide a valid 'default_price' parameter (e.g., '19.99')",
                  "timestamp": DateTime.now().toIso8601String(),
                };
              }

              for (int i = 0; i < simpleVariants.length; i++) {
                final variant = Variant(
                  option1: simpleVariants[i],
                  price: defaultPrice,
                  sku: params['default_sku'] != null
                      ? '${params['default_sku']}-${i + 1}'
                      : null,
                );
                variants.add(variant);
              }

              // Skip the rest of variant processing since we handled it here
              variantsData = [];
            } else {
              return {
                "status": "error",
                "statusCode": 400,
                "message": "Bad Request",
                "details":
                    "Variants parameter cannot be empty. Use format: 'Small, Medium, Large' or JSON array",
                "timestamp": DateTime.now().toIso8601String(),
              };
            }
          } else {
            // If it's a JSON string, parse it
            try {
              final variantsJson = json.decode(variantsParam);
              if (variantsJson is List) {
                variantsData = variantsJson;
              } else {
                return {
                  "status": "error",
                  "statusCode": 400,
                  "message": "Bad Request",
                  "details":
                      "Variants parameter must be a JSON array of variant objects. Received: '$variantsParam'",
                  "timestamp": DateTime.now().toIso8601String(),
                };
              }
            } catch (e) {
              return {
                "status": "error",
                "statusCode": 400,
                "message": "Bad Request",
                "details":
                    "Invalid JSON format for variants parameter. Received: '$variantsParam'. Error: ${e.toString()}. Expected formats: 1) 'Small, Medium, Large' with default_price, 2) JSON array: [{'option1': 'Small', 'price': '19.99'}]",
                "timestamp": DateTime.now().toIso8601String(),
              };
            }
          }
        } else {
          // Handle other types (Map, etc.)
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Bad Request",
            "details":
                "Variants parameter must be either a List or a JSON string. Received type: ${variantsParam.runtimeType}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Process each variant
        for (final variantData in variantsData) {
          if (variantData is Map<String, dynamic>) {
            // Validate required variant fields
            final option1 = variantData['option1'] as String?;
            final price = variantData['price'] as String?;

            if (option1 == null || option1.isEmpty) {
              return {
                "status": "error",
                "statusCode": 400,
                "message": "Bad Request",
                "details": "Each variant must have an 'option1' value.",
                "timestamp": DateTime.now().toIso8601String(),
              };
            }

            if (price == null || price.isEmpty) {
              return {
                "status": "error",
                "statusCode": 400,
                "message": "Bad Request",
                "details": "Each variant must have a 'price' value.",
                "timestamp": DateTime.now().toIso8601String(),
              };
            }

            // Validate price format
            if (!_isValidPrice(price)) {
              return {
                "status": "error",
                "statusCode": 400,
                "message": "Bad Request",
                "details":
                    "Invalid price format. Price must be a valid decimal number (e.g., '29.99').",
                "timestamp": DateTime.now().toIso8601String(),
              };
            }

            final variant = Variant(
              option1: option1,
              price: price,
              sku: variantData['sku'] as String?,
            );
            variants.add(variant);
          }
        }
      }

      // If no variants provided, create a default variant
      if (variants.isEmpty) {
        final defaultPrice = params['default_price'] ?? '0.00';
        if (!_isValidPrice(defaultPrice)) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Bad Request",
            "details":
                "Invalid default price format. Price must be a valid decimal number (e.g., '29.99').",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        variants.add(Variant(
          option1: 'Default Title',
          price: defaultPrice,
          sku: params['default_sku'],
        ));
      }

      // Create the product object
      final product = Product(
        title: title,
        bodyHtml: bodyHtml,
        vendor: vendor,
        productType: productType,
        variants: variants,
      );

      // Create the request object
      final request = CreateProductMultiVariantsRequest(product: product);

      // Get the ProductService and make the API call
      final productService = GetIt.instance<ProductService>();
      final response = await productService.createProductMultiVariants(
        apiVersion: '2023-10',
        model: request,
      );

      // Return success response
      return {
        "status": "success",
        "statusCode": 201,
        "message": "Product with variants created successfully",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle different types of errors
      String errorMessage = e.toString().toLowerCase();
      int statusCode = 500;

      if (errorMessage.contains('unauthorized') ||
          errorMessage.contains('401')) {
        statusCode = 401;
        return {
          "status": "error",
          "statusCode": 401,
          "message": "Unauthorized",
          "details": "Invalid API credentials or insufficient permissions.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('forbidden') ||
          errorMessage.contains('403')) {
        statusCode = 403;
        return {
          "status": "error",
          "statusCode": 403,
          "message": "Forbidden",
          "details":
              "Access denied. Check your API permissions for product creation.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('unprocessable') ||
          errorMessage.contains('422')) {
        statusCode = 422;
        return {
          "status": "error",
          "statusCode": 422,
          "message": "Unprocessable Entity",
          "details":
              "Product data validation failed. Please check your input parameters.",
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

      // Generic error response
      return {
        "status": "error",
        "statusCode": statusCode,
        "message": "Failed to create product with variants",
        "details": e.toString(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  /// 🔍 Validate price format
  bool _isValidPrice(String price) {
    try {
      final parsedPrice = double.parse(price);
      return parsedPrice >= 0;
    } catch (e) {
      return false;
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
            name: 'variants',
            label: 'Product Variants',
            hint:
                'Variants in 3 formats: 1) Array: [{"option1": "Small", "price": "19.99"}] 2) JSON string 3) Simple: "Small, Medium, Large" (requires default_price)',
            isRequired: false,
          ),
          const ApiField(
            name: 'default_price',
            label: 'Default Price',
            hint: 'Default price if no variants are provided (e.g., "29.99")',
            isRequired: false,
          ),
          const ApiField(
            name: 'default_sku',
            label: 'Default SKU',
            hint: 'Default SKU if no variants are provided',
            isRequired: false,
          ),
        ],
      };
}
