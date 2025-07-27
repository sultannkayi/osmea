import 'package:apis/network/remote/woocommerce/datas/countries/freezed_model/response/list_all_countries_response.dart';
import 'package:apis/network/remote/woocommerce/datas/countries/freezed_model/response/retrieve_country_response.dart';

abstract class CountriesService {
  /// List all countries
  ///
  /// Returns a list of all countries with their states.
  Future<List<ListAllCountriesResponse>> listAllCountries({
    String? apiVersion,
  });

  /// Retrieve country data
  ///
  /// Returns data for a specific country by code.
  Future<RetrieveCountryResponse> retrieveCountry({
    required String code,
    String? apiVersion,
  });
}
