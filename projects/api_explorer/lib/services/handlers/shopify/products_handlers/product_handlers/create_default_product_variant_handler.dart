import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/create_default_product_variant_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:apis/apis.dart';

///*******************************************************************
//*********** 🔧 CREATE DEFAULT PRODUCT VARIANT HANDLER 🔧 ********
///*******************************************************************

class CreateDefaultProductVariantHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    // Only handle POST requests for creating products with default variant
    if (method != 'POST') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Create Default Product Variant API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract required parameters
      final title = params['title'];
      if (title == null || title.isEmpty) {
        return {
          "status": "error",
          "message": "Title is required for creating a product",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Extract optional product fields
      final bodyHtml = params['body_html'] as String?;
      final vendor = params['vendor'] as String?;
      final productType = params['product_type'] as String?;

      // Handle tags
      List<String>? tags;
      final dynamic tagsParam = params['tags'];
      if (tagsParam != null) {
        if (tagsParam is String) {
          // If tags is a string, split by comma
          tags = tagsParam
              .split(',')
              .map((tag) => tag.trim())
              .where((tag) => tag.isNotEmpty)
              .toList();
        } else if (tagsParam is List) {
          // If tags is already a list, convert to List<String>
          tags = tagsParam
              .map((tag) => tag.toString().trim())
              .where((tag) => tag.isNotEmpty)
              .toList();
        }
      }

      // Create the product request
      final product = req.Product(
        title: title.toString().trim(),
        bodyHtml: bodyHtml?.trim(),
        vendor: vendor?.trim(),
        productType: productType?.trim(),
        tags: tags,
      );

      final request = req.CreateDefaultProductVariantRequest(product: product);

      // Call the API method using ApiNetwork.apiVersion (fixed - no manual API version)
      final response =
          await GetIt.I<ProductService>().createDefaultProductVariant(
        apiVersion: ApiNetwork.apiVersion,
        model: request,
      );

      // Return successful response
      return {
        "status": "success",
        "message": "Product with default variant created successfully",
        "product": response.product?.toJson(),
        "params": {
          "title": title,
          "body_html": bodyHtml,
          "vendor": vendor,
          "product_type": productType,
          "tags": tags,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Enhanced error handling
      String errorMessage = e.toString();
      if (e.toString().contains('400') || e.toString().contains('422')) {
        errorMessage = 'Invalid product data: ${e.toString()}';
      } else if (e.toString().contains('401')) {
        errorMessage =
            'Authentication failed. Please check your API credentials.';
      } else if (e.toString().contains('403')) {
        errorMessage =
            'Access denied. You don\'t have permission to create products.';
      } else if (e.toString().contains('429')) {
        errorMessage = 'Rate limit exceeded. Please try again later.';
      }

      return {
        "status": "error",
        "message": errorMessage,
        "details": e.toString(),
        "timestamp": DateTime.now().toIso8601String(),
      };
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
            hint: 'The title of the product (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'body_html',
            label: 'Product Description',
            hint: 'The HTML description of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'vendor',
            label: 'Vendor',
            hint: 'The vendor/brand of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'product_type',
            label: 'Product Type',
            hint: 'The type/category of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'tags',
            label: 'Product Tags',
            hint: 'Comma-separated tags for the product',
            isRequired: false,
          ),
        ],
      };
}
