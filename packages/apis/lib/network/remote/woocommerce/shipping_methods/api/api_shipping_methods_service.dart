import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/shipping_methods/abstract/shipping_methods_service.dart';
import 'package:apis/network/remote/woocommerce/shipping_methods/freezed_model/response/list_all_shipping_methods_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_methods/freezed_model/response/retrieve_shipping_method_response.dart';

part 'api_shipping_methods_service.g.dart';

@RestApi()
@Injectable(as: ShippingMethodsService)
abstract class ApiShippingMethodsService implements ShippingMethodsService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ApiShippingMethodsService(Dio dio) => _ApiShippingMethodsService(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/shipping_methods')
  Future<List<ListAllShippingMethodsResponse>> listAllShippingMethods({
    @Path('apiVersion') String? apiVersion,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/shipping_methods/{id}')
  Future<RetrieveShippingMethodResponse> retrieveShippingMethod({
    @Path('id') required String id,
    @Path('apiVersion') String? apiVersion,
  });
}
