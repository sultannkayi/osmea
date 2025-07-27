import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/variations/abstract/product_variations_service.dart';
import 'package:dio/dio.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';

class RetrieveProductVariationHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Product ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'variation_id',
            label: 'Variation ID',
            hint: 'Variation ID to retrieve (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Validate required product_id parameter
      final productIdStr = params['product_id']?.toString() ?? '';
      final productId = int.tryParse(productIdStr);

      if (productId == null || productId <= 0) {
        return {
          'success': false,
          'message':
              'Valid product_id is required and must be a positive integer',
        };
      }

      // Validate required variation_id parameter
      final variationIdStr = params['variation_id']?.toString() ?? '';
      final variationId = int.tryParse(variationIdStr);

      if (variationId == null || variationId <= 0) {
        return {
          'success': false,
          'message':
              'Valid variation_id is required and must be a positive integer',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      print('🔍 Retrieve Product Variation Parameters:');
      print('  API Version: $apiVersion');
      print('  Product ID: $productId');
      print('  Variation ID: $variationId');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductVariationsService>();
      final response = await service.retrieveProductVariation(
        apiVersion: apiVersion,
        productId: productId,
        variationId: variationId,
      );

      print('✅ Retrieve Product Variation Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product variation retrieved successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      String errorMessage = 'Failed to retrieve product variation';

      if (e.response?.statusCode == 404) {
        errorMessage = 'Product variation not found';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      print('❌ Retrieve Product Variation Error: $errorMessage');
      print('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Retrieve Product Variation Unexpected Error: ${e.toString()}');
      return {
        'success': false,
        'message':
            'Unexpected error occurred while retrieving product variation',
        'error_details': e.toString(),
      };
    }
  }
}
