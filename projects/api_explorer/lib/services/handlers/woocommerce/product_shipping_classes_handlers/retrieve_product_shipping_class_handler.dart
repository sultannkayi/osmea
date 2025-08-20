import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/abstract/product_shipping_classes_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

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

      debugPrint('🔍 Retrieve Product Shipping Class Parameters:');
      debugPrint('  Shipping Class ID: $shippingClassId');
      debugPrint('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductShippingClassesService>();
      final response = await service.retrieveProductShippingClass(
        apiVersion: apiVersion,
        shippingClassId: shippingClassId,
      );

      debugPrint('✅ Retrieve Product Shipping Class Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product shipping class retrieved successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve product shipping class: $e',
        'error_details': e.toString(),
      };
    }
  }
}
