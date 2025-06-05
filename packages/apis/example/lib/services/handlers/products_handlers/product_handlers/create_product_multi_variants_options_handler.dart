import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_product_multi_variants_options_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
//******* ➕ CREATE PRODUCT MULTI VARIANTS OPTIONS HANDLER ➕ ******
///*******************************************************************

class CreateProductMultiVariantsOptionsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle POST requests for creating products
    if (method != 'POST') {
      return {
        "status": "error",
        "message": "Method $method not supported for Create Product API",
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

      // Parse options - expecting JSON array format
      List<Option> options = [];
      final optionsParam = params['options'];
      if (optionsParam != null && optionsParam.isNotEmpty) {
        try {
          // Parse options from JSON string format like: [{"name":"Color","values":["Red","Blue"]},{"name":"Size","values":["S","M","L"]}]
          final optionsData = optionsParam;
          // Simple parsing - in real scenario you might want more robust JSON parsing
          if (optionsData.contains('Color') ||
              optionsData.contains('Size') ||
              optionsData.contains('Material')) {
            // Parse basic color option
            if (optionsData.contains('Color')) {
              final colorValues = _extractValues(optionsData, 'Color');
              options.add(Option(name: 'Color', values: colorValues));
            }
            // Parse basic size option
            if (optionsData.contains('Size')) {
              final sizeValues = _extractValues(optionsData, 'Size');
              options.add(Option(name: 'Size', values: sizeValues));
            }
            // Parse basic material option
            if (optionsData.contains('Material')) {
              final materialValues = _extractValues(optionsData, 'Material');
              options.add(Option(name: 'Material', values: materialValues));
            }
          }
        } catch (e) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Invalid options format",
            "details": "Options should be in format: Color:Red,Blue;Size:S,M,L",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      // Parse variants - expecting format like: "Red,S:10.00;Blue,M:12.00"
      List<Variant> variants = [];
      final variantsParam = params['variants'];
      if (variantsParam != null && variantsParam.isNotEmpty) {
        try {
          final variantPairs = variantsParam.split(';');
          for (final pair in variantPairs) {
            if (pair.trim().isNotEmpty) {
              final parts = pair.split(':');
              if (parts.isNotEmpty) {
                final optionsPart = parts[0].split(',');
                final option1 =
                    optionsPart.isNotEmpty ? optionsPart[0].trim() : null;
                final option2 =
                    optionsPart.length > 1 ? optionsPart[1].trim() : null;

                variants.add(Variant(
                  option1: option1,
                  option2: option2,
                ));
              }
            }
          }
        } catch (e) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Invalid variants format",
            "details": "Variants should be in format: Red,S:10.00;Blue,M:12.00",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      // If no variants specified, create a default variant
      if (variants.isEmpty) {
        variants.add(const Variant());
      }

      // Create the product request
      final productRequest = CreateProductMultiVariantsOptionsRequest(
        product: Product(
          title: title,
          bodyHtml: bodyHtml,
          vendor: vendor,
          productType: productType,
          options: options.isNotEmpty ? options : null,
          variants: variants,
        ),
      );

      // Call the API method to create product
      final response =
          await GetIt.I<ProductService>().createProductMultiVariantsOptions(
        apiVersion: ApiNetwork.apiVersion,
        model: productRequest,
      );

      // Return success response with created product data
      return {
        "status": "success",
        "message": "Product created successfully with variants and options",
        "data": response.toJson(),
        "product_info": {
          "id": response.product?.id,
          "title": response.product?.title,
          "variants_count": response.product?.variants?.length ?? 0,
          "options_count": response.product?.options?.length ?? 0,
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
          "details": "Product validation failed. Please check your data.",
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

  /// Helper method to extract option values from string
  List<String> _extractValues(String optionsData, String optionName) {
    try {
      // Simple regex to extract values for a given option name
      final pattern = RegExp('$optionName[^:]*:([^;}]+)');
      final match = pattern.firstMatch(optionsData);
      if (match != null) {
        final valuesStr = match.group(1);
        if (valuesStr != null) {
          return valuesStr
              .split(',')
              .map((v) => v.trim())
              .where((v) => v.isNotEmpty)
              .toList();
        }
      }
      return [];
    } catch (e) {
      return [];
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
            name: 'options',
            label: 'Product Options',
            hint:
                'Product options in format: Color:Red,Blue,Green;Size:S,M,L,XL',
            isRequired: false,
          ),
          const ApiField(
            name: 'variants',
            label: 'Product Variants',
            hint:
                'Product variants in format: Red,S;Blue,M;Green,L (option1,option2)',
            isRequired: false,
          ),
        ],
      };

  /// 📊 Get handler information
  static Map<String, dynamic> getHandlerInfo() {
    return {
      "handler_name": "CreateProductMultiVariantsOptionsHandler",
      "description": "Creates a new product with multiple variants and options",
      "supported_methods": ["POST"],
      "required_parameters": ["title"],
      "optional_parameters": [
        "body_html",
        "vendor",
        "product_type",
        "options",
        "variants"
      ],
      "api_endpoint": "/api/{api_version}/products.json",
      "examples": {
        "basic_product": {
          "method": "POST",
          "parameters": {
            "title": "Awesome T-Shirt",
            "body_html": "<p>A comfortable cotton t-shirt</p>",
            "vendor": "Cool Brand",
            "product_type": "T-Shirts"
          }
        },
        "product_with_variants": {
          "method": "POST",
          "parameters": {
            "title": "Stylish T-Shirt",
            "body_html": "<p>Available in multiple colors and sizes</p>",
            "vendor": "Fashion Co",
            "product_type": "Apparel",
            "options": "Color:Red,Blue,Green;Size:S,M,L,XL",
            "variants": "Red,S;Blue,M;Green,L;Red,XL"
          }
        }
      }
    };
  }
}
