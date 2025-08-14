import 'package:apis/apis.dart';
import 'package:dio/dio.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/abstract/product_shipping_classes_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class RetrieveProductShippingClassHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'shipping_class_id',
            label: 'Shipping Class ID',
            hint: 'Shipping class ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Parse shipping_class_id (required)
      final shippingClassIdStr = params['shipping_class_id']?.toString() ?? '';
      final shippingClassId = int.tryParse(shippingClassIdStr);
      if (shippingClassId == null || shippingClassId <= 0) {
        return {
          'success': false,
          'message':
              'Valid shipping_class_id is required and must be a positive integer',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      print('🔍 Retrieve Product Shipping Class Parameters:');
      print('  Shipping Class ID: $shippingClassId');
      print('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductShippingClassesService>();
      final response = await service.retrieveProductShippingClass(
        apiVersion: apiVersion,
        shippingClassId: shippingClassId,
      );

      print('✅ Retrieve Product Shipping Class Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product shipping class retrieved successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      print('❌ Retrieve Product Shipping Class DioException: ${e.toString()}');
      print('🔍 Status Code: ${e.response?.statusCode}');
      print('🔍 Response Data: ${e.response?.data}');
      print('🔍 Response Headers: ${e.response?.headers}');

      String errorMessage = 'Failed to retrieve product shipping class';
      if (e.response?.statusCode == 404) {
        errorMessage = 'Product shipping class not found';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Retrieve Product Shipping Class Error: ${e.toString()}');
      return {
        'success': false,
        'message':
            'Unexpected error occurred while retrieving product shipping class',
        'error_details': e.toString(),
      };
    }
  }
}
