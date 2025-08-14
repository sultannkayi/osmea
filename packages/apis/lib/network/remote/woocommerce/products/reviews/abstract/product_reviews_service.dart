import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/list_all_product_reviews_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/create_product_review_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/retrieve_product_review_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/update_product_review_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/delete_product_review_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/request/batch_update_product_reviews_request.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/batch_update_product_reviews_response.dart';

/// 📝 Abstract service for WooCommerce Product Reviews API operations
abstract class ProductReviewsService {
  /// 📋 List all product reviews
  Future<List<ListProductReviewsResponse>> listAllProductReviews({
    required String apiVersion,
    String? context,
    int? page,
    int? perPage,
    String? search,
    String? after,
    String? before,
    List<int>? exclude,
    List<int>? include,
    int? offset,
    String? order,
    String? orderby,
    List<int>? reviewer,
    List<String>? reviewerExclude,
    List<String>? reviewerEmail,
    List<int>? product,
    String? status,
  });

  /// ➕ Create a new product review
  Future<CreateProductReviewResponse> createProductReview({
    required String apiVersion,
    required Map<String, dynamic> reviewData,
  });

  /// 🔍 Retrieve a specific product review
  Future<RetrieveProductReviewResponse> retrieveProductReview({
    required String apiVersion,
    required int reviewId,
  });

  /// ✏️ Update a product review
  Future<UpdateProductReviewResponse> updateProductReview({
    required String apiVersion,
    required int reviewId,
    required Map<String, dynamic> reviewData,
  });

  /// 🗑️ Delete a product review
  Future<DeleteProductReviewResponse> deleteProductReview({
    required String apiVersion,
    required int reviewId,
    bool? force,
  });

  /// 📦 Batch update product reviews in the WooCommerce API.
  Future<BatchUpdateProductReviewsResponse> batchUpdateProductReviews({
    required String apiVersion,
    required BatchUpdateProductReviewsRequest batchData,
  });
}
