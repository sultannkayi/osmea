import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/products/variations/abstract/product_variations_service.dart';
import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/list_all_product_variations_response.dart';
import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/create_product_variation_response.dart';
import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/retrieve_product_variation_response.dart';
import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/update_product_variation_response.dart';
import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/delete_product_variation_response.dart';

part 'api_product_variations_service.g.dart';

@RestApi()
@Injectable(as: ProductVariationsService)
abstract class ProductVariationsServiceClient
    implements ProductVariationsService {
  @factoryMethod
  factory ProductVariationsServiceClient(Dio dio) =>
      _ProductVariationsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/products/{productId}/variations')
  Future<List<ListAllProductVariationsResponse>> listAllProductVariations({
    @Path('apiVersion') required String apiVersion,
    @Path('productId') required int productId,
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
    @Query('parent') List<int>? parent,
    @Query('parent_exclude') List<int>? parentExclude,
    @Query('slug') String? slug,
    @Query('status') String? status,
    @Query('sku') String? sku,
    @Query('featured') String? featured,
    @Query('category') String? category,
    @Query('tag') String? tag,
    @Query('shipping_class') String? shippingClass,
    @Query('attribute') String? attribute,
    @Query('attribute_term') String? attributeTerm,
    @Query('tax_class') String? taxClass,
    @Query('on_sale') String? onSale,
    @Query('min_price') String? minPrice,
    @Query('max_price') String? maxPrice,
    @Query('stock_status') String? stockStatus,
  });

  @override
  @POST('/wp-json/wc/{apiVersion}/products/{productId}/variations')
  Future<CreateProductVariationResponse> createProductVariation({
    @Path('apiVersion') required String apiVersion,
    @Path('productId') required int productId,
    @Body() required Map<String, dynamic> variationData,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/products/{productId}/variations/{variationId}')
  Future<RetrieveProductVariationResponse> retrieveProductVariation({
    @Path('apiVersion') required String apiVersion,
    @Path('productId') required int productId,
    @Path('variationId') required int variationId,
  });

  @override
  @PUT('/wp-json/wc/{apiVersion}/products/{productId}/variations/{variationId}')
  Future<UpdateProductVariationResponse> updateProductVariation({
    @Path('apiVersion') required String apiVersion,
    @Path('productId') required int productId,
    @Path('variationId') required int variationId,
    @Body() required Map<String, dynamic> variationData,
  });

  @override
  @DELETE(
      '/wp-json/wc/{apiVersion}/products/{productId}/variations/{variationId}')
  Future<DeleteProductVariationResponse> deleteProductVariation({
    @Path('apiVersion') required String apiVersion,
    @Path('productId') required int productId,
    @Path('variationId') required int variationId,
    @Query('force') bool? force,
  });
}
