import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/abstract/product_attribute_terms_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RetrieveProductAttributeTermHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'attribute_id',
            label: 'Attribute ID',
            hint: 'Attribute ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'term_id',
            label: 'Term ID',
            hint: 'Term ID to retrieve (required)',
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
      // Validate required attribute_id parameter
      final attributeIdStr = params['attribute_id']?.toString() ?? '';
      final attributeId = int.tryParse(attributeIdStr);

      if (attributeId == null || attributeId <= 0) {
        return {
          'success': false,
          'message':
              'Valid attribute_id is required and must be a positive integer',
        };
      }

      // Validate required term_id parameter
      final termIdStr = params['term_id']?.toString() ?? '';
      final termId = int.tryParse(termIdStr);

      if (termId == null || termId <= 0) {
        return {
          'success': false,
          'message': 'Valid term_id is required and must be a positive integer',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      debugPrint('🔍 Retrieve Product Attribute Term Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Attribute ID: $attributeId');
      debugPrint('  Term ID: $termId');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductAttributeTermsService>();
      final response = await service.retrieveProductAttributeTerm(
        apiVersion: apiVersion,
        attributeId: attributeId,
        termId: termId,
      );

      debugPrint('✅ Retrieve Product Attribute Term Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product attribute term retrieved successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve product attribute term: $e',
        'error_details': e.toString(),
      };
    }
  }
}
