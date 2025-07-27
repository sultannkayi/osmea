import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/datas/countries/abstract/countries_service.dart';
import 'package:apis/network/remote/woocommerce/datas/countries/freezed_model/response/list_all_countries_response.dart';
import 'package:apis/network/remote/woocommerce/datas/countries/freezed_model/response/retrieve_country_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'api_countries_service.g.dart';

@RestApi()
@Injectable(as: CountriesService)
abstract class ApiCountriesService implements CountriesService {
  @factoryMethod
  factory ApiCountriesService(Dio dio) => _ApiCountriesService(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/data/countries')
  Future<List<ListAllCountriesResponse>> listAllCountries({
    @Path('apiVersion') String? apiVersion = 'v3',
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/data/countries/{code}')
  Future<RetrieveCountryResponse> retrieveCountry({
    @Path('code') required String code,
    @Path('apiVersion') String? apiVersion = 'v3',
  });
}
