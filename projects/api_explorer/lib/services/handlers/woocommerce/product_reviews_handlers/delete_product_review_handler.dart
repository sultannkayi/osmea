import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/abstract/product_reviews_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class DeleteProductReviewHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'review_id',
            label: 'Review ID',
            hint: 'Review ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Force delete (true/false). Default: false (moves to trash)',
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
      // Parse review_id (required)
      final reviewIdStr = params['review_id']?.toString() ?? '';
      final reviewId = int.tryParse(reviewIdStr);
      if (reviewId == null || reviewId <= 0) {
        return {
          'success': false,
          'message':
              'Valid review_id is required and must be a positive integer',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Parse force parameter (optional)
      bool? force;
      if (params['force'] != null) {
        final forceStr = params['force'].toString().toLowerCase();
        if (forceStr == 'true' || forceStr == '1') {
          force = true;
        } else if (forceStr == 'false' || forceStr == '0') {
          force = false;
        }
      }

      debugPrint('🔍 Delete Product Review Parameters:');
      debugPrint('  Review ID: $reviewId');
      debugPrint('  Force: $force');
      debugPrint('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductReviewsService>();
      final response = await service.deleteProductReview(
        apiVersion: apiVersion,
        reviewId: reviewId,
        force: force,
      );

      debugPrint('✅ Delete Product Review Success: ${response.toJson()}');

      final deletionType =
          force == true ? 'permanently deleted' : 'moved to trash';
      return {
        'success': true,
        'message': 'Product review $deletionType successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to delete product review: $e',
        'error_details': e.toString(),
      };
    }
  }
}
