import 'package:apis/network/remote/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_product_with_metafield_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:apis/apis.dart';

///*******************************************************************
//*********** 🏷️ CREATE PRODUCT WITH METAFIELD HANDLER 🏷️ ********
///*******************************************************************

class CreateProductWithMetafieldHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    // Only handle POST requests for creating products with metafields
    if (method != 'POST') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Create Product With Metafield API",
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

      // Extract optional product parameters
      final bodyHtml = params['body_html'];
      final vendor = params['vendor'];
      final productType = params['product_type'];

      // Extract metafield parameters
      final metafieldKey = params['metafield_key'];
      final metafieldValue = params['metafield_value'];
      final metafieldType =
          params['metafield_type'] ?? 'single_line_text_field';
      final metafieldNamespace = params['metafield_namespace'] ?? 'global';

      // Validate metafield parameters if any are provided
      if (metafieldKey != null && metafieldKey.isNotEmpty) {
        if (metafieldValue == null || metafieldValue.isEmpty) {
          return {
            "status": "error",
            "statusCode": 400,
            "message": "Bad Request",
            "details":
                "Metafield value is required when metafield key is provided.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      // Prepare metafields array if metafield data is provided
      List<Metafield>? metafields;
      if (metafieldKey != null &&
          metafieldKey.isNotEmpty &&
          metafieldValue != null &&
          metafieldValue.isNotEmpty) {
        metafields = [
          Metafield(
            key: metafieldKey,
            value: metafieldValue,
            type: metafieldType,
            namespace: metafieldNamespace,
          ),
        ];
      }

      // Create the product request model
      final productRequest = CreateProductWithMetafieldRequest(
        product: Product(
          title: title,
          bodyHtml: bodyHtml,
          vendor: vendor,
          productType: productType,
          metafields: metafields,
        ),
      );

      // Call the API method
      final response =
          await GetIt.I<ProductService>().createProductWithMetafield(
        apiVersion: ApiNetwork.apiVersion,
        model: productRequest,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Product with metafield created successfully",
        "product": response.product?.toJson(),
        "params": {
          "title": title,
          "body_html": bodyHtml,
          "vendor": vendor,
          "product_type": productType,
          "has_metafield": metafields != null,
          "metafield_count": metafields?.length ?? 0,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Enhanced error handling
      String errorMessage = e.toString();
      int statusCode = 500;

      // Check for specific error types
      if (errorMessage.contains('422')) {
        statusCode = 422;
        return {
          "status": "error",
          "statusCode": 422,
          "message": "Unprocessable Entity",
          "details": "The request was well-formed but contains invalid data. "
              "Check that all required fields are provided and metafield type matches the value format.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('400')) {
        statusCode = 400;
        return {
          "status": "error",
          "statusCode": 400,
          "message": "Bad Request",
          "details": "The request contains invalid parameters. "
              "Verify that the product title and metafield data are correctly formatted.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Default error response
      return {
        "status": "error",
        "statusCode": statusCode,
        "message": "Failed to create product with metafield: $errorMessage",
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
            hint: 'The title of the product',
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
            hint: 'The vendor of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'product_type',
            label: 'Product Type',
            hint: 'The type/category of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'metafield_key',
            label: 'Metafield Key',
            hint: 'The key for the product metafield (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'metafield_value',
            label: 'Metafield Value',
            hint:
                'The value for the product metafield (required if key is provided)',
            isRequired: false,
          ),
          const ApiField(
            name: 'metafield_type',
            label: 'Metafield Type',
            hint: 'The type of the metafield (default: single_line_text_field)',
            isRequired: false,
          ),
          const ApiField(
            name: 'metafield_namespace',
            label: 'Metafield Namespace',
            hint: 'The namespace for the metafield (default: global)',
            isRequired: false,
          ),
        ],
      };
}
