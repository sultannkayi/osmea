import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/abstract/product_shipping_classes_service.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/list_all_product_shipping_classes_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/create_product_shipping_class_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/retrieve_product_shipping_class_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/update_product_shipping_class_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/delete_product_shipping_class_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/request/batch_update_product_shipping_classes_request.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/batch_update_product_shipping_classes_response.dart';

part 'api_product_shipping_classes_service.g.dart';

@RestApi()
@Injectable(as: ProductShippingClassesService)
abstract class ProductShippingClassesServiceClient
    implements ProductShippingClassesService {
  @factoryMethod
  factory ProductShippingClassesServiceClient(Dio dio) =>
      _ProductShippingClassesServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/products/shipping_classes')
  Future<List<ListAllProductShippingClasses>> listAllProductShippingClasses({
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
  @POST('/wp-json/wc/{apiVersion}/products/shipping_classes')
  Future<CreateProductShippingClassResponse> createProductShippingClass({
    @Path('apiVersion') required String apiVersion,
    @Body() required Map<String, dynamic> shippingClassData,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/products/shipping_classes/{shippingClassId}')
  Future<RetrieveProductShippingClassResponse> retrieveProductShippingClass({
    @Path('apiVersion') required String apiVersion,
    @Path('shippingClassId') required int shippingClassId,
  });

  @override
  @PUT('/wp-json/wc/{apiVersion}/products/shipping_classes/{shippingClassId}')
  Future<UpdateProductShippingClassResponse> updateProductShippingClass({
    @Path('apiVersion') required String apiVersion,
    @Path('shippingClassId') required int shippingClassId,
    @Body() required Map<String, dynamic> shippingClassData,
  });

  @override
  @DELETE(
      '/wp-json/wc/{apiVersion}/products/shipping_classes/{shippingClassId}')
  Future<DeleteProductShippingClassResponse> deleteProductShippingClass({
    @Path('apiVersion') required String apiVersion,
    @Path('shippingClassId') required int shippingClassId,
    @Query('force') bool? force,
  });

  /// 📦 Batch update product shipping classes in WooCommerce API
  @override
  @PATCH('/wp-json/wc/{apiVersion}/products/shipping_classes/batch')
  Future<BatchUpdateProductShippingClassesResponse>
      batchUpdateProductShippingClasses({
    @Path('apiVersion') required String apiVersion,
    @Body() required BatchUpdateProductShippingClassesRequest batchData,
  });
}
