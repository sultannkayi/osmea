import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/products/tags/abstract/product_tags_service.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/list_all_product_tags_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/create_product_tag_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/retrieve_product_tag_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/update_product_tag_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/delete_product_tag_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/request/batch_update_product_tags_request.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/batch_update_product_tags_response.dart';

part 'api_product_tags_service.g.dart';

@RestApi()
@Injectable(as: ProductTagsService)
abstract class ProductTagsServiceClient implements ProductTagsService {
  @factoryMethod
  factory ProductTagsServiceClient(Dio dio) => _ProductTagsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/products/tags')
  Future<List<ListAllProductTagsResponse>> listAllProductTags({
    @Path('apiVersion') required String apiVersion,
    @Query('context') String? context,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('search') String? search,
    @Query('exclude') List<int>? exclude,
    @Query('include') List<int>? include,
    @Query('offset') int? offset,
    @Query('order') String? order,
    @Query('orderby') String? orderby,
    @Query('hide_empty') bool? hideEmpty,
    @Query('product') int? product,
    @Query('slug') String? slug,
  });

  @override
  @POST('/wp-json/wc/{apiVersion}/products/tags')
  Future<CreateProductTagResponse> createProductTag({
    @Path('apiVersion') required String apiVersion,
    @Body() required Map<String, dynamic> tagData,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/products/tags/{tagId}')
  Future<RetrieveProductTagResponse> retrieveProductTag({
    @Path('apiVersion') required String apiVersion,
    @Path('tagId') required int tagId,
  });

  @override
  @PUT('/wp-json/wc/{apiVersion}/products/tags/{tagId}')
  Future<UpdateProductTagResponse> updateProductTag({
    @Path('apiVersion') required String apiVersion,
    @Path('tagId') required int tagId,
    @Body() required Map<String, dynamic> tagData,
  });

  @override
  @DELETE('/wp-json/wc/{apiVersion}/products/tags/{tagId}')
  Future<DeleteProductTagResponse> deleteProductTag({
    @Path('apiVersion') required String apiVersion,
    @Path('tagId') required int tagId,
    @Query('force') bool? force,
  });

  /// 📦 Batch update product tags in WooCommerce API
  @override
  @PATCH('/wp-json/wc/{apiVersion}/products/tags/batch')
  Future<BatchUpdateProductTagsResponse> batchUpdateProductTags({
    @Path('apiVersion') required String apiVersion,
    @Body() required BatchUpdateProductTagsRequest batchData,
  });
}
