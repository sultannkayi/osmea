import 'package:apis/network/remote/woocommerce/datas/currencies/freezed_model/response/list_all_currencies_response.dart';
import 'package:apis/network/remote/woocommerce/datas/currencies/freezed_model/response/retrieve_currency_data_response.dart';
import 'package:apis/network/remote/woocommerce/datas/currencies/freezed_model/response/retrieve_current_currency_response.dart';

abstract class CurrenciesService {
  /// List all currencies
  ///
  /// Returns a list of all available currencies.
  Future<List<ListAllCurrenciesResponse>> listAllCurrencies({
    String? apiVersion,
  });

  /// Retrieve currency data
  ///
  /// Returns data for a specific currency by code.
  Future<RetrieveCurrencyDataResponse> retrieveCurrencyData({
    required String code,
    String? apiVersion,
  });

  /// Retrieve current currency
  ///
  /// Returns the currently active currency.
  Future<RetrieveCurrentCurrencyResponse> retrieveCurrentCurrency({
    String? apiVersion,
  });
}
