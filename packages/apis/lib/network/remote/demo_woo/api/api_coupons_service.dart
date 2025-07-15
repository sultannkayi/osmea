import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/dio_config/interceptors/api_interceptor_default.dart';
import 'package:apis/network/remote/demo_woo/abstract/coupons_service.dart';
import 'package:apis/network/remote/demo_woo/freezed_model/list_all_coupons_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_coupons_service.g.dart';

/// 🌐 AccessScopeServiceClient
/// Retrofit client for Access Scope API.
/// Make sure ApiNetwork.storeName and shopifyAccessToken are set before using! 🏬🔑
@RestApi()
@Injectable(as: CouponsService)
abstract class CouponsServiceClient implements CouponsService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory CouponsServiceClient(Dio dio) => _CouponsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 🔓 Get access scopes from API
  @override
  @GET('/wp-json/wc/v3/coupons')
  Future<List<ListAllCouponsResponse>> listAllCoupons();
}
