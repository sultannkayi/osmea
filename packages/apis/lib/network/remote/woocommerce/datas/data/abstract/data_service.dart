import 'package:apis/network/remote/woocommerce/datas/data/freezed_model/response/list_all_data_response.dart';

abstract class DataService {
  /// List all data
  ///
  /// Returns a list of all available data endpoints.
  Future<List<ListAllDataResponse>> listAllData({
    String? apiVersion,
  });
}
