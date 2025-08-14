import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/abstract/product_reviews_service.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/list_all_product_reviews_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/create_product_review_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/retrieve_product_review_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/update_product_review_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/delete_product_review_response.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/request/batch_update_product_reviews_request.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/response/batch_update_product_reviews_response.dart';

part 'api_product_reviews_service.g.dart';

@RestApi()
@Injectable(as: ProductReviewsService)
abstract class ProductReviewsServiceClient implements ProductReviewsService {
  @factoryMethod
  factory ProductReviewsServiceClient(Dio dio) => _ProductReviewsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/products/reviews')
  Future<List<ListProductReviewsResponse>> listAllProductReviews({
    @Path('apiVersion') required String apiVersion,
    @Query('context') String? context,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('search') String? search,
    @Query('after') String? after,
    @Query('before') String? before,
    @Query('exclude') List<int>? exclude,
    @Query('include') List<int>? include,
    @Query('offset') int? offset,
    @Query('order') String? order,
    @Query('orderby') String? orderby,
    @Query('reviewer') List<int>? reviewer,
    @Query('reviewer_exclude') List<String>? reviewerExclude,
    @Query('reviewer_email') List<String>? reviewerEmail,
    @Query('product') List<int>? product,
    @Query('status') String? status,
  });

  @override
  @POST('/wp-json/wc/{apiVersion}/products/reviews')
  Future<CreateProductReviewResponse> createProductReview({
    @Path('apiVersion') required String apiVersion,
    @Body() required Map<String, dynamic> reviewData,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/products/reviews/{reviewId}')
  Future<RetrieveProductReviewResponse> retrieveProductReview({
    @Path('apiVersion') required String apiVersion,
    @Path('reviewId') required int reviewId,
  });

  @override
  @PUT('/wp-json/wc/{apiVersion}/products/reviews/{reviewId}')
  Future<UpdateProductReviewResponse> updateProductReview({
    @Path('apiVersion') required String apiVersion,
    @Path('reviewId') required int reviewId,
    @Body() required Map<String, dynamic> reviewData,
  });

  @override
  @DELETE('/wp-json/wc/{apiVersion}/products/reviews/{reviewId}')
  Future<DeleteProductReviewResponse> deleteProductReview({
    @Path('apiVersion') required String apiVersion,
    @Path('reviewId') required int reviewId,
    @Query('force') bool? force,
  });

  /// 📦 Batch update product reviews in WooCommerce API
  @override
  @PATCH('/wp-json/wc/{apiVersion}/products/reviews/batch')
  Future<BatchUpdateProductReviewsResponse> batchUpdateProductReviews({
    @Path('apiVersion') required String apiVersion,
    @Body() required BatchUpdateProductReviewsRequest batchData,
  });
}
