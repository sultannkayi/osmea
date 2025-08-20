import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/abstract/product_shipping_classes_service.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/request/update_product_shipping_class_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class UpdateProductShippingClassHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'shipping_class_id',
            label: 'Shipping Class ID',
            hint: 'Shipping class ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'name',
            label: 'Name',
            hint: 'Updated shipping class name',
            isRequired: false,
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Updated unique slug for the shipping class',
            isRequired: false,
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Updated description of the shipping class',
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

      // Parse optional update fields
      final name = params['name']?.toString();
      final slug = params['slug']?.toString();
      final description = params['description']?.toString();

      debugPrint('🔍 Update Product Shipping Class Parameters:');
      debugPrint('  Shipping Class ID: $shippingClassId');
      debugPrint('  Name: $name');
      debugPrint('  Slug: $slug');
      debugPrint('  Description: $description');
      debugPrint('  API Version: $apiVersion');

      // Create request object
      final updateRequest = UpdateProductShippingClassRequest(
        name: name?.trim(),
        slug: slug?.trim(),
        description: description?.trim(),
      );

      debugPrint('📋 Request Body: ${updateRequest.toJson()}');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductShippingClassesService>();
      final response = await service.updateProductShippingClass(
        apiVersion: apiVersion,
        shippingClassId: shippingClassId,
        shippingClassData: updateRequest.toJson(),
      );

      debugPrint('✅ Update Product Shipping Class Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product shipping class updated successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to update product shipping class: $e',
        'error_details': e.toString(),
      };
    }
  }
}
