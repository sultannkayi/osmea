import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/variations/abstract/product_variations_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class DeleteProductVariationHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Product ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'variation_id',
            label: 'Variation ID',
            hint: 'Variation ID to delete (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Whether to permanently delete (true/false/1/0)',
            isRequired: false,
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

      // Parse force parameter
      bool? force;
      if (params['force'] != null) {
        final forceStr = params['force'].toString().toLowerCase();
        if (forceStr == 'true' || forceStr == '1') {
          force = true;
        } else if (forceStr == 'false' || forceStr == '0') {
          force = false;
        }
      }

      debugPrint('🗑️ Delete Product Variation Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Product ID: $productId');
      debugPrint('  Variation ID: $variationId');
      debugPrint('  Force Delete: $force');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductVariationsService>();
      final response = await service.deleteProductVariation(
        apiVersion: apiVersion,
        productId: productId,
        variationId: variationId,
        force: force,
      );

      debugPrint('✅ Delete Product Variation Success: ${response.toJson()}');

      // Provide appropriate message based on force parameter
      String successMessage = 'Product variation deleted successfully';
      if (force == true) {
        successMessage = 'Product variation permanently deleted';
      } else if (force == false) {
        successMessage = 'Product variation moved to trash';
      }

      return {
        'success': true,
        'message': successMessage,
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to delete product variation: $e',
        'error_details': e.toString(),
      };
    }
  }
}
