import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/abstract/product_attributes_service.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/list_all_product_attributes_response.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/create_product_attribute_response.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/retrieve_product_attribute_response.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/update_product_attribute_response.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/delete_product_attribute_response.dart';

part 'api_product_attributes_service.g.dart';

@RestApi()
@Injectable(as: ProductAttributesService)
abstract class ProductAttributesServiceClient
    implements ProductAttributesService {
  @factoryMethod
  factory ProductAttributesServiceClient(Dio dio) =>
      _ProductAttributesServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/products/attributes')
  Future<List<ListAllProductAttributesResponse>> listAllProductAttributes({
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
    @Query('slug') String? slug,
  });

  @override
  @POST('/wp-json/wc/{apiVersion}/products/attributes')
  Future<CreateProductAttributeResponse> createProductAttribute({
    @Path('apiVersion') required String apiVersion,
    @Body() required Map<String, dynamic> attributeData,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/products/attributes/{attributeId}')
  Future<RetrieveProductAttributeResponse> retrieveProductAttribute({
    @Path('apiVersion') required String apiVersion,
    @Path('attributeId') required int attributeId,
  });

  @override
  @PUT('/wp-json/wc/{apiVersion}/products/attributes/{attributeId}')
  Future<UpdateProductAttributeResponse> updateProductAttribute({
    @Path('apiVersion') required String apiVersion,
    @Path('attributeId') required int attributeId,
    @Body() required Map<String, dynamic> attributeData,
  });

  @override
  @DELETE('/wp-json/wc/{apiVersion}/products/attributes/{attributeId}')
  Future<DeleteProductAttributeResponse> deleteProductAttribute({
    @Path('apiVersion') required String apiVersion,
    @Path('attributeId') required int attributeId,
    @Query('force') bool? force,
  });
}
