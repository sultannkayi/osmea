import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/datas/countries/abstract/countries_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';

class RetrieveCountryDataHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error': 'Method $method not supported for Retrieve Country Data API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final code = params['code'];
      if (code == null || code.isEmpty) {
        return {
          'success': false,
          'error': 'Country code is required',
          'message': 'Please provide a valid country code',
        };
      }

      final apiVersion = params['api_version'] ?? 'v3';

      print(
          '🔍 Retrieving country data for code: $code, API version: $apiVersion');

      final service = WooNetwork.getIt.get<CountriesService>();
      final response = await service.retrieveCountry(
        code: code,
        apiVersion: apiVersion,
      );

      print('✅ Successfully retrieved country data: ${response.name}');

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Country data retrieved successfully',
      };
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve country data: ${e.message}',
      };
    } catch (e) {
      print('❌ Unexpected error: $e');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Unexpected error: $e',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'code',
            label: 'Country Code',
            hint: 'Country code (e.g., TR, US, GB, DE, FR)',
            isRequired: true,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'API version (default: v3)',
            isRequired: false,
          ),
        ],
      };
}
