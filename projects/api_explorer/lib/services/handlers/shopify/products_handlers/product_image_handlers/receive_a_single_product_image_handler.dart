import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///************** 🖼 GET SINGLE PRODUCT IMAGE HANDLER **********
///**************************************************************

class GetSingleProductImageHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product that owns the image',
            isRequired: true,
          ),
          ApiField(
            name: 'image_id',
            label: 'Image ID',
            hint: 'ID of the image to retrieve',
            isRequired: true,
          ),
          ApiField(
            name: 'fields',
            label: 'Fields',
            hint: 'Comma-separated list of fields to include (optional)',
            isRequired: false,
          ),
        ],
      };
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    try {
      // Method validation
      if (method != 'GET') {
        return {
          'status': 'error',
          'message': 'Method $method not supported. Only GET is allowed.',
          'timestamp': DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Error validating HTTP method: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parameter validation
      final productId = params['product_id'];
      if (productId == null) {
        return {
          'status': 'error',
          'message': 'Missing required parameter: product_id',
          'timestamp': DateTime.now().toIso8601String(),
        };
      }

      final imageId = params['image_id'];
      if (imageId == null) {
        return {
          'status': 'error',
          'message': 'Missing required parameter: image_id',
          'timestamp': DateTime.now().toIso8601String(),
        };
      }

      // Service operation
      try {
        final service = GetIt.I<ProductImageService>();
        final response = await service.getSingleProductImage(
          apiVersion: ApiNetwork.apiVersion,
          productId: productId,
          imageId: imageId,
          fields: params['fields'],
        );

        return {
          'status': 'success',
          'message': 'Successfully retrieved product image',
          'data': response.toJson(),
          'timestamp': DateTime.now().toIso8601String(),
        };
      } catch (e) {
        return {
          'status': 'error',
          'message': 'Failed to retrieve product image: ${e.toString()}',
          'timestamp': DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Error validating parameters: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }
}
