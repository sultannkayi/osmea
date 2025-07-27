import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/datas/continents/abstract/continents_service.dart';
import 'package:apis/network/remote/woocommerce/datas/continents/freezed_model/response/list_all_continents_response.dart';
import 'package:apis/network/remote/woocommerce/datas/continents/freezed_model/response/retrieve_continent_data_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'api_continents_service.g.dart';

@RestApi()
@Injectable(as: ContinentsService)
abstract class ApiContinentsService implements ContinentsService {
  @factoryMethod
  factory ApiContinentsService(Dio dio) => _ApiContinentsService(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/data/continents')
  Future<List<ListAllContinentsResponse>> listAllContinents({
    @Path('apiVersion') String? apiVersion = 'v3',
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/data/continents/{code}')
  Future<RetrieveContinentDataResponse> retrieveContinentData({
    @Path('code') required String code,
    @Path('apiVersion') String? apiVersion = 'v3',
  });
}
