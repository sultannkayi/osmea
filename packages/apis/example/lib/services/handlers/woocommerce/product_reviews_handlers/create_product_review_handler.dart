import 'package:apis/apis.dart';
import 'package:dio/dio.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/abstract/product_reviews_service.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/request/create_product_review_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';

class CreateProductReviewHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Product ID (required)',
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
      // Parse product_id (required)
      final productIdStr = params['product_id']?.toString() ?? '';
      final productId = int.tryParse(productIdStr);
      if (productId == null || productId <= 0) {
        return {
          'success': false,
          'message':
              'Valid product_id is required and must be a positive integer',
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

      print('🔍 Create Product Review Parameters:');
      print('  Product ID: $productId');
      print('  Review: $review');
      print('  Reviewer: $reviewer');
      print('  Reviewer Email: $reviewerEmail');
      print('  Rating: $rating');
      print('  Status: $status');
      print('  API Version: $apiVersion');

      // Create request object
      final createRequest = CreateProductReviewRequest(
        productId: productId,
        review: review,
        reviewer: reviewer,
        reviewerEmail: reviewerEmail,
        rating: rating,
        status: status,
      );

      print('📋 Request Body: ${createRequest.toJson()}');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductReviewsService>();
      final response = await service.createProductReview(
        apiVersion: apiVersion,
        reviewData: createRequest.toJson(),
      );

      print('✅ Create Product Review Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product review created successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      print('❌ Create Product Review DioException: ${e.toString()}');
      print('🔍 Status Code: ${e.response?.statusCode}');
      print('🔍 Response Data: ${e.response?.data}');
      print('🔍 Response Headers: ${e.response?.headers}');

      String errorMessage = 'Failed to create product review';
      if (e.response?.data != null) {
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
      print('❌ Create Product Review Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while creating product review',
        'error_details': e.toString(),
      };
    }
  }
}
