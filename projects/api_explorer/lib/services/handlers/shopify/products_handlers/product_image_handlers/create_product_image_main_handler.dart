import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

import 'package:get_it/get_it.dart';

///**************************************************************
///************** 🖼️ CREATE PRODUCT IMAGE MAIN HANDLER *********
///**************************************************************

class CreateProductImageMainHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product to add the image to',
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
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'POST') {
      return {
        'status': 'error',
        'message': 'Method $method not supported. Only POST is allowed.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    final productId = params['product_id'];
    final src = params['src'];
    final alt = params['alt'];

    if (productId == null || src == null) {
      return {
        'status': 'error',
        'message': 'Missing required parameters: product_id and src',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      final response =
          await GetIt.I<ProductImageService>().createProductImageMain(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: {
          "image": {
            "src": src,
            if (alt != null) "alt": alt,
          }
        },
      );

      return {
        'status': 'success',
        'message': 'Product image created successfully',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to create product image: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }
}
