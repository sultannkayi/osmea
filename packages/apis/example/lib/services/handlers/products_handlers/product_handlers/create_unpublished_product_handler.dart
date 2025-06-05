import 'package:apis/network/remote/products/product/abstract/product_service.dart'
    show ProductService;
import 'package:apis/network/remote/products/product/freezed_model/request/create_unpublished_product_request.dart'
    as req;
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:apis/apis.dart';

///*******************************************************************
//************ 🚫 CREATE UNPUBLISHED PRODUCT HANDLER 🚫 ************
///*******************************************************************

class CreateUnpublishedProductHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    // Only handle POST requests for creating unpublished products
    if (method != 'POST') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Create Unpublished Product API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract required parameters
      final title = params['title']?.toString();
      final bodyHtml = params['body_html']?.toString();
      final vendor = params['vendor']?.toString();
      final productType = params['product_type']?.toString();

      // Validate required parameters
      if (title == null || title.isEmpty) {
        return {
          "status": "error",
          "message": "Product title is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Create the request JSON
      final requestJson = {
        "product": {
          "title": title,
          "body_html": bodyHtml,
          "vendor": vendor,
          "product_type": productType,
          "published": false, // This is what makes it unpublished
        }
      };

      // Convert to proper request model
      final productRequest =
          req.CreateUnpublishedProductRequest.fromJson(requestJson);

      // Call the API method
      final response = await GetIt.I<ProductService>().createUnpublishedProduct(
        apiVersion: ApiNetwork.apiVersion,
        model: productRequest,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Unpublished product created successfully",
        "product": response.product?.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to create unpublished product: ${e.toString()}",
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
            hint: 'The name of the unpublished product',
            isRequired: true,
          ),
          const ApiField(
            name: 'body_html',
            label: 'Product Description',
            hint: 'The HTML description of the product (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'vendor',
            label: 'Vendor',
            hint: 'The vendor/manufacturer of the product (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'product_type',
            label: 'Product Type',
            hint: 'The category/type of the product (optional)',
            isRequired: false,
          ),
        ],
      };
}
