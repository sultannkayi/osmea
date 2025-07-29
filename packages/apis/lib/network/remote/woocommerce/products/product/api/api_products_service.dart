import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/products/product/abstract/products_service.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/list_all_products_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/request/create_product_request.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/create_product_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/retrieve_product_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/update_product_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/delete_product_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/request/batch_update_products_request.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/batch_update_products_response.dart';

part 'api_products_service.g.dart';

@RestApi()
@Injectable(as: ProductsService)
abstract class ProductsServiceClient implements ProductsService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ProductsServiceClient(Dio dio) => _ProductsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET("/wp-json/wc/v3/products")
  Future<List<ListAllProductsResponse>> listAllProducts({
    @Query("context") String? context,
    @Query("page") int? page,
    @Query("per_page") int? perPage,
    @Query("search") String? search,
    @Query("after") String? after,
    @Query("before") String? before,
    @Query("exclude") String? exclude,
    @Query("include") String? include,
    @Query("offset") int? offset,
    @Query("order") String? order,
    @Query("orderby") String? orderBy,
    @Query("parent") String? parent,
    @Query("parent_exclude") String? parentExclude,
    @Query("slug") String? slug,
    @Query("status") String? status,
    @Query("type") String? type,
    @Query("sku") String? sku,
    @Query("featured") bool? featured,
    @Query("category") String? category,
    @Query("tag") String? tag,
    @Query("shipping_class") String? shippingClass,
    @Query("attribute") String? attribute,
    @Query("attribute_term") String? attributeTerm,
    @Query("tax_class") String? taxClass,
    @Query("min_price") String? minPrice,
    @Query("max_price") String? maxPrice,
    @Query("stock_status") String? stockStatus,
    @Query("on_sale") bool? onSale,
  });

  @override
  @GET("/wp-json/wc/v3/products/{product_id}")
  Future<RetrieveProductResponse> retrieveProduct(
    @Path("product_id") int productId, {
    @Query("context") String? context,
  });

  /// ✨ Create a new product in WooCommerce API
  @override
  @POST('/wp-json/wc/{api_version}/products')
  Future<CreateProductResponse> createProduct({
    @Path('api_version') required String apiVersion,
    @Body() required Map<String, dynamic> productData,
  });

  @override
  @PUT("/wp-json/wc/v3/products/{product_id}")
  Future<UpdateProductResponse> updateProduct(
    @Path("product_id") int productId,
    @Body() Map<String, dynamic> productData,
  );

  @override
  @DELETE("/wp-json/wc/v3/products/{product_id}")
  Future<DeleteProductResponse> deleteProduct(
    @Path("product_id") int productId, {
    @Query("force") bool? force,
  });

  @override
  @GET("/wp-json/wc/v3/products/{product_id}/custom_fields/names")
  Future<List<String>> retrieveProductCustomFieldNames(
    @Path("product_id") int productId,
  );

  /// 📦 Batch update products in WooCommerce API
  @override
  @PATCH('/wp-json/wc/{api_version}/products/batch')
  Future<BatchUpdateProductsResponse> batchUpdateProducts({
    @Path('api_version') required String apiVersion,
    @Body() required BatchUpdateProductsRequest batchData,
  });
}
