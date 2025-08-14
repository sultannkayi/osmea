import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/products/categories/abstract/product_categories_service.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/list_all_product_categories_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/create_product_category_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/retrieve_product_category_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/update_product_category_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/delete_product_category_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/request/batch_update_product_categories_request.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/batch_update_product_categories_response.dart';

part 'api_product_categories_service.g.dart';

@RestApi()
@Injectable(as: ProductCategoriesService)
abstract class ProductCategoriesServiceClient
    implements ProductCategoriesService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ProductCategoriesServiceClient(Dio dio) =>
      _ProductCategoriesServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 📋 List all product categories from WooCommerce API
  @override
  @GET('/wp-json/wc/{apiVersion}/products/categories')
  Future<ListAllProductCategoriesResponse> listAllProductCategories({
    @Path('apiVersion') required String apiVersion,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('search') String? search,
    @Query('exclude') List<int>? exclude,
    @Query('include') List<int>? include,
    @Query('order') String? order,
    @Query('orderby') String? orderby,
    @Query('hide_empty') bool? hideEmpty,
    @Query('parent') int? parent,
    @Query('product') int? product,
    @Query('slug') String? slug,
  });

  @override
  @POST('/wp-json/wc/{apiVersion}/products/categories')
  Future<CreateProductCategoryResponse> createProductCategory({
    @Path('apiVersion') required String apiVersion,
    @Body() required Map<String, dynamic> categoryData,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/products/categories/{id}')
  Future<RetrieveProductCategoryResponse> retrieveProductCategory({
    @Path('apiVersion') required String apiVersion,
    @Path('id') required int categoryId,
  });

  @override
  @PUT('/wp-json/wc/{apiVersion}/products/categories/{id}')
  Future<UpdateProductCategoryResponse> updateProductCategory({
    @Path('apiVersion') required String apiVersion,
    @Path('id') required int categoryId,
    @Body() required Map<String, dynamic> categoryData,
  });

  @override
  @DELETE('/wp-json/wc/{apiVersion}/products/categories/{id}')
  Future<DeleteProductCategoryResponse> deleteProductCategory({
    @Path('apiVersion') required String apiVersion,
    @Path('id') required int categoryId,
    @Query('force') bool? force,
  });

  /// 📦 Batch update product categories in WooCommerce API
  @override
  @PATCH('/wp-json/wc/{apiVersion}/products/categories/batch')
  Future<BatchUpdateProductCategoriesResponse> batchUpdateProductCategories({
    @Path('apiVersion') required String apiVersion,
    @Body() required BatchUpdateProductCategoriesRequest batchData,
  });
}
