import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/store_properties/country/abstract/country_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///**************************************************************
///************ 🔢 COUNT OF COUNTRIES HANDLER ******************
///**************************************************************

class RetrievesCountOfCountriesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    if (method != 'GET') {
      return {
        "error": "Method $method not supported. Only GET is allowed.",
      };
    }

    try {
      final response = await GetIt.I
          .get<CountryService>()
          .retrievesCountOfCountries(apiVersion: ApiNetwork.apiVersion);

      return {
        "status": "success",
        "count": response.count ?? 0,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to retrieve country count: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [],
      };
}
