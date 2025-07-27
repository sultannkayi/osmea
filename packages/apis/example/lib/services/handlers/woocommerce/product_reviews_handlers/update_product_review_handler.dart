import 'package:apis/apis.dart';
import 'package:dio/dio.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/abstract/product_reviews_service.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/request/update_product_review_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';

class UpdateProductReviewHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'review_id',
            label: 'Review ID',
            hint: 'Review ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'review',
            label: 'Review',
            hint: 'Review content',
            isRequired: false,
          ),
          const ApiField(
            name: 'reviewer',
            label: 'Reviewer',
            hint: 'Reviewer name',
            isRequired: false,
          ),
          const ApiField(
            name: 'reviewer_email',
            label: 'Reviewer Email',
            hint: 'Reviewer email address',
            isRequired: false,
          ),
          const ApiField(
            name: 'rating',
            label: 'Rating',
            hint: 'Rating (1-5)',
            isRequired: false,
          ),
          const ApiField(
            name: 'status',
            label: 'Status',
            hint: 'Review status (approved, hold, spam, etc.)',
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

      // Parse optional review fields
      final review = params['review']?.toString();
      final reviewer = params['reviewer']?.toString();
      final reviewerEmail = params['reviewer_email']?.toString();

      // Parse rating (optional)
      int? rating;
      if (params['rating'] != null) {
        rating = int.tryParse(params['rating'].toString());
        if (rating != null && (rating < 1 || rating > 5)) {
          return {
            'success': false,
            'message': 'Rating must be between 1 and 5',
          };
        }
      }

      // Parse status (optional)
      final status = params['status']?.toString();

      print('🔍 Update Product Review Parameters:');
      print('  Review ID: $reviewId');
      print('  Review: $review');
      print('  Reviewer: $reviewer');
      print('  Reviewer Email: $reviewerEmail');
      print('  Rating: $rating');
      print('  Status: $status');
      print('  API Version: $apiVersion');

      // Create request object
      final updateRequest = UpdateProductReviewRequest(
        review: review,
        reviewer: reviewer,
        reviewerEmail: reviewerEmail,
        rating: rating,
        status: status,
      );

      print('📋 Request Body: ${updateRequest.toJson()}');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductReviewsService>();
      final response = await service.updateProductReview(
        apiVersion: apiVersion,
        reviewId: reviewId,
        reviewData: updateRequest.toJson(),
      );

      print('✅ Update Product Review Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product review updated successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      print('❌ Update Product Review DioException: ${e.toString()}');
      print('🔍 Status Code: ${e.response?.statusCode}');
      print('🔍 Response Data: ${e.response?.data}');
      print('🔍 Response Headers: ${e.response?.headers}');

      String errorMessage = 'Failed to update product review';
      if (e.response?.statusCode == 404) {
        errorMessage = 'Product review not found';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Update Product Review Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while updating product review',
        'error_details': e.toString(),
      };
    }
  }
}
