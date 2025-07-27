import 'package:apis/network/remote/woocommerce/datas/continents/freezed_model/response/list_all_continents_response.dart';
import 'package:apis/network/remote/woocommerce/datas/continents/freezed_model/response/retrieve_continent_data_response.dart';

abstract class ContinentsService {
  /// List all continents
  ///
  /// Returns a list of all continents with their countries and states.
  Future<List<ListAllContinentsResponse>> listAllContinents({
    String? apiVersion,
  });

  /// Retrieve continent data
  ///
  /// Returns data for a specific continent by code.
  Future<RetrieveContinentDataResponse> retrieveContinentData({
    required String code,
    String? apiVersion,
  });
}
