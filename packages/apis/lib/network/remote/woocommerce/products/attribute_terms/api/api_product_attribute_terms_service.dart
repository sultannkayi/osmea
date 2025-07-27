import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/abstract/product_attribute_terms_service.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/list_all_product_attribute_terms_response.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/create_product_attribute_term_response.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/retrieve_product_attribute_term_response.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/update_product_attribute_term_response.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/delete_product_attribute_term_response.dart';

part 'api_product_attribute_terms_service.g.dart';

@RestApi()
@Injectable(as: ProductAttributeTermsService)
abstract class ProductAttributeTermsServiceClient
    implements ProductAttributeTermsService {
  @factoryMethod
  factory ProductAttributeTermsServiceClient(Dio dio) =>
      _ProductAttributeTermsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/products/attributes/{attributeId}/terms')
  Future<List<ListAllProductAttributeTermsResponse>>
      listAllProductAttributeTerms({
    @Path('apiVersion') required String apiVersion,
    @Path('attributeId') required int attributeId,
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
    @Query('parent') String? parent,
    @Query('product') String? product,
    @Query('slug') String? slug,
  });

  @override
  @POST('/wp-json/wc/{apiVersion}/products/attributes/{attributeId}/terms')
  Future<CreateProductAttributeTermResponse> createProductAttributeTerm({
    @Path('apiVersion') required String apiVersion,
    @Path('attributeId') required int attributeId,
    @Body() required Map<String, dynamic> termData,
  });

  @override
  @GET(
      '/wp-json/wc/{apiVersion}/products/attributes/{attributeId}/terms/{termId}')
  Future<RetrieveProductAttributeTermResponse> retrieveProductAttributeTerm({
    @Path('apiVersion') required String apiVersion,
    @Path('attributeId') required int attributeId,
    @Path('termId') required int termId,
  });

  @override
  @PUT(
      '/wp-json/wc/{apiVersion}/products/attributes/{attributeId}/terms/{termId}')
  Future<UpdateProductAttributeTermResponse> updateProductAttributeTerm({
    @Path('apiVersion') required String apiVersion,
    @Path('attributeId') required int attributeId,
    @Path('termId') required int termId,
    @Body() required Map<String, dynamic> termData,
  });

  @override
  @DELETE(
      '/wp-json/wc/{apiVersion}/products/attributes/{attributeId}/terms/{termId}')
  Future<DeleteProductAttributeTermResponse> deleteProductAttributeTerm({
    @Path('apiVersion') required String apiVersion,
    @Path('attributeId') required int attributeId,
    @Path('termId') required int termId,
    @Query('force') bool? force,
  });
}
