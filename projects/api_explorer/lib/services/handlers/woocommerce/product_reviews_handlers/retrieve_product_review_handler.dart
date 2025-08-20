import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/abstract/product_reviews_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RetrieveProductReviewHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'review_id',
            label: 'Review ID',
            hint: 'Review ID (required)',
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

      debugPrint('🔍 Retrieve Product Review Parameters:');
      debugPrint('  Review ID: $reviewId');
      debugPrint('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductReviewsService>();
      final response = await service.retrieveProductReview(
        apiVersion: apiVersion,
        reviewId: reviewId,
      );

      debugPrint('✅ Retrieve Product Review Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product review retrieved successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve product review: $e',
        'error_details': e.toString(),
      };
    }
  }
}
