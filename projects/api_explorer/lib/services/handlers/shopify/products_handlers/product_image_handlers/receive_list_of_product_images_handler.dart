import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///************ 🖼 LIST PRODUCT IMAGES HANDLER (V2) ************
///**************************************************************

class RetrieveListOfProductImagesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'status': 'error',
        'message': 'Method $method not supported. Only GET is allowed.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    final productId = params['product_id'];
    if (productId == null) {
      return {
        'status': 'error',
        'message': 'Missing required parameter: product_id',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      final response = await GetIt.I<ProductImageService>().getProductImages(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        fields: params['fields'],
        sinceId: params['since_id'],
      );

      return {
        'status': 'success',
        'message': 'Successfully retrieved product images',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to retrieve product images: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product whose images you want to list',
            isRequired: true,
          ),
          ApiField(
            name: 'fields',
            label: 'Fields',
            hint: 'Comma-separated list of fields to include (optional)',
            isRequired: false,
          ),
          ApiField(
            name: 'since_id',
            label: 'Since ID',
            hint: 'Only return images with ID greater than since_id (optional)',
            isRequired: false,
          ),
        ],
      };
}
