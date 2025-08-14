import 'package:apis/apis.dart';
import 'package:dio/dio.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/abstract/product_shipping_classes_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class DeleteProductShippingClassHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'shipping_class_id',
            label: 'Shipping Class ID',
            hint: 'Shipping class ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Force delete (true/false). Default: false (moves to trash)',
            isRequired: false,
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

      // Parse force parameter (optional)
      bool? force;
      if (params['force'] != null) {
        final forceStr = params['force'].toString().toLowerCase();
        if (forceStr == 'true' || forceStr == '1') {
          force = true;
        } else if (forceStr == 'false' || forceStr == '0') {
          force = false;
        }
      }

      print('🔍 Delete Product Shipping Class Parameters:');
      print('  Shipping Class ID: $shippingClassId');
      print('  Force: $force');
      print('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductShippingClassesService>();
      final response = await service.deleteProductShippingClass(
        apiVersion: apiVersion,
        shippingClassId: shippingClassId,
        force: force,
      );

      print('✅ Delete Product Shipping Class Success: ${response.toJson()}');

      final deletionType =
          force == true ? 'permanently deleted' : 'moved to trash';
      return {
        'success': true,
        'message': 'Product shipping class $deletionType successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      print('❌ Delete Product Shipping Class DioException: ${e.toString()}');
      print('🔍 Status Code: ${e.response?.statusCode}');
      print('🔍 Response Data: ${e.response?.data}');
      print('🔍 Response Headers: ${e.response?.headers}');

      String errorMessage = 'Failed to delete product shipping class';
      if (e.response?.statusCode == 404) {
        errorMessage = 'Product shipping class not found';
      } else if (e.response?.statusCode == 410) {
        errorMessage = 'Product shipping class already deleted';
      } else if (e.response?.statusCode == 409) {
        errorMessage =
            'Cannot delete shipping class that is assigned to products';
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
      print('❌ Delete Product Shipping Class Error: ${e.toString()}');
      return {
        'success': false,
        'message':
            'Unexpected error occurred while deleting product shipping class',
        'error_details': e.toString(),
      };
    }
  }
}
