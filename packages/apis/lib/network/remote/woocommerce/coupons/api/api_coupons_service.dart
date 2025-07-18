import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/dio_config/interceptors/api_interceptor_default.dart';
import 'package:apis/network/remote/woocommerce/coupons/abstract/coupons_service.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/list_all_coupons_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_coupons_service.g.dart';

/// 🌐 CouponsServiceClient
/// Retrofit client for WooCommerce Coupons API.
/// Make sure WooNetwork.storeUrl, username, and password are set before using! 🏬🔑
@RestApi()
@Injectable(as: CouponsService)
abstract class CouponsServiceClient implements CouponsService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory CouponsServiceClient(Dio dio) => _CouponsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 🔓 Get coupons from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/coupons')
  Future<List<ListAllCouponsResponse>> listAllCoupons({
    @Path('api_version') required String apiVersion,
  });
}
