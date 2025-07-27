import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/datas/currencies/abstract/currencies_service.dart';
import 'package:apis/network/remote/woocommerce/datas/currencies/freezed_model/response/list_all_currencies_response.dart';
import 'package:apis/network/remote/woocommerce/datas/currencies/freezed_model/response/retrieve_currency_data_response.dart';
import 'package:apis/network/remote/woocommerce/datas/currencies/freezed_model/response/retrieve_current_currency_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'api_currencies_service.g.dart';

@RestApi()
@Injectable(as: CurrenciesService)
abstract class ApiCurrenciesService implements CurrenciesService {
  @factoryMethod
  factory ApiCurrenciesService(Dio dio) => _ApiCurrenciesService(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/data/currencies')
  Future<List<ListAllCurrenciesResponse>> listAllCurrencies({
    @Path('apiVersion') String? apiVersion = 'v3',
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/data/currencies/{code}')
  Future<RetrieveCurrencyDataResponse> retrieveCurrencyData({
    @Path('code') required String code,
    @Path('apiVersion') String? apiVersion = 'v3',
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/data/currencies/current')
  Future<RetrieveCurrentCurrencyResponse> retrieveCurrentCurrency({
    @Path('apiVersion') String? apiVersion = 'v3',
  });
}
