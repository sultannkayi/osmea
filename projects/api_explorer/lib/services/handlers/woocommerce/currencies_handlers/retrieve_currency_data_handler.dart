import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/datas/currencies/abstract/currencies_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';

class RetrieveCurrencyDataHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error': 'Method $method not supported for Retrieve Currency Data API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final code = params['code'];
      if (code == null || code.isEmpty) {
        return {
          'success': false,
          'error': 'Currency code is required',
          'message': 'Please provide a valid currency code',
        };
      }

      final apiVersion = params['api_version'] ?? 'v3';

      print(
          '🔍 Retrieving currency data for code: $code, API version: $apiVersion');

      final service = WooNetwork.getIt.get<CurrenciesService>();
      final response = await service.retrieveCurrencyData(
        code: code,
        apiVersion: apiVersion,
      );

      print('✅ Successfully retrieved currency data: ${response.name}');

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Currency data retrieved successfully',
      };
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve currency data: ${e.message}',
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
            label: 'Currency Code',
            hint: 'Currency code (e.g., USD, EUR, TRY, GBP, JPY)',
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
