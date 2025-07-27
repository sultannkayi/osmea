import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/datas/data/abstract/data_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:dio/dio.dart';

class ListAllDataHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error': 'Method $method not supported for List All Data API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final apiVersion = params['api_version'] ?? 'v3';

      print('🔍 Listing all data with API version: $apiVersion');

      final service = WooNetwork.getIt.get<DataService>();
      final response = await service.listAllData(
        apiVersion: apiVersion,
      );

      print('✅ Successfully retrieved ${response.length} data endpoints');

      return {
        'success': true,
        'data': response.map((item) => item.toJson()).toList(),
        'message': 'Data list retrieved successfully',
      };
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve data list: ${e.message}',
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
            name: 'api_version',
            label: 'API Version',
            hint: 'API version (default: v3)',
            isRequired: false,
          ),
        ],
      };
}
